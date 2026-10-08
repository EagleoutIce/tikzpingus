#!/usr/bin/env bash
# Builds build/tikzpingus-doc.pdf.
#   ./build-doc.sh             full build
#   NOLINKS=1 ./build-doc.sh   without code-link (faster)
#   JOBS=4 ./build-doc.sh      number of parallel example jobs (default: all cores)
set -e -o pipefail
cd "$(dirname "$0")"
mkdir -p build
JOBS=${JOBS:-$(nproc)}
flags=""
[ -n "$NOLINKS" ] && flags='\def\pinguDocLinks{0}'

# 1. Examples: a dry run writes every example to build/sub_*.tex, each is compiled as its own job.
#    They only change with the document or the package, so they are kept if neither changed.
compile() {
  printf '\\gdef\\TCBEXTERNALINPUT{"%s.tex"}\\gdef\\TCBEXTERNALSAFETY{2mm}\\gdef\\TCBEXTERNALPREAMBLE{}\\input{"tikzpingus-doc.tex"}\n' "$1" > "build/run_$1.tex"
  pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname="$1" -output-directory=build "build/run_$1.tex" > /dev/null \
    || echo "example failed: $1 (see build/$1.log)" >&2
  rm -f "build/run_$1.tex"
  printf .
}
export -f compile

stamp=$(cat tikzpingus-doc.tex ../tex/*.sty | md5sum)
if [ "$stamp" = "$(cat build/stamp 2> /dev/null)" ]; then
  echo "examples: up to date"
else
  echo "examples: dry run"
  rm -f build/sub_*
  pdflatex -interaction=nonstopmode -output-directory=build '\def\pinguDocDry{1}\input{tikzpingus-doc}' > build/dry.log || true
  echo "examples: compiling, $JOBS at a time"
  (cd build && ls sub_*.tex) | sed 's/\.tex$//' | xargs -P "$JOBS" -n1 bash -c 'compile $0'
  echo
  echo "$stamp" > build/stamp
fi
[ "$1" = prepare ] && exit 0

# 2. Document: repeated until the references and the index stop changing
state() { cat build/*.aux build/*.toc build/*.ind 2> /dev/null | md5sum; }
for run in 1 2 3; do
  before=$(state)
  pdflatex -shell-escape -interaction=nonstopmode -output-directory=build "$flags\\input{tikzpingus-doc}" > "build/run$run.log" &
  pid=$!
  # show the page being typeset: updated in place on a terminal, else every 25th page
  tail -f --pid=$pid "build/run$run.log" | grep --line-buffered -o '\[[0-9]\+' | tr -d '[' | while read -r page; do
    if [ -t 1 ]; then printf '\rrun %s: page %s ' "$run" "$page"
    elif [ $((page % 25)) = 0 ]; then echo "run $run: page $page"; fi
  done
  [ -t 1 ] && echo
  if ! wait $pid; then
    echo "run $run failed, first error:" >&2
    grep -A4 '^!' "build/run$run.log" | head -12 >&2
    echo "full log: build/run$run.log" >&2
    exit 1
  fi
  for idx in build/*.idx; do makeindex -q -s indexstyle.ist -o "${idx%.idx}.ind" "$idx" 2> /dev/null; done
  [ "$(state)" = "$before" ] && break
done
echo "done: build/tikzpingus-doc.pdf"
