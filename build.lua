#!/usr/bin/env texlua

-- Execute with ======================================================
-- l3build tag
-- l3build ctan
-- l3build upload
-- l3build clean
-- Settings ==========================================================
bundle = ""
module = "tikzpingus"
ctanpkg = module
builddir = os.getenv("TMPDIR")

-- Package version ===================================================
local handle = io.popen("git describe --tags $(git rev-list --tags --max-count=1)")
local oldtag = handle:read("*a")
handle:close()
newsubtag = string.sub(oldtag, 4)
newmajortag = string.sub(oldtag, 0, 3)
if (options["target"] == "tag") then
    newsubtag = newsubtag + 1
end
packageversion = newmajortag .. math.floor(newsubtag)
-- packageversion="v1.3"

-- Package date ======================================================
packagedate = os.date("!%Y-%m-%d")
-- packagedate = "2020-01-02"

-- interacting with git ==============================================
function git(...)
    local args = {...}
    table.insert(args, 1, 'git')
    local cmd = table.concat(args, ' ')
    print('Executing:', cmd)
    os.execute(cmd)
end

-- replace version tags in .sty and -doc.tex files ===================
tagfiles = {"*.sty", "doc/*.tex"}
function update_tag(file, content, tagname, tagdate)
    tagdate = string.gsub(packagedate, "-", "/")
    if string.match(file, "%.sty$") then
        content = string.gsub(content, "\\ProvidesPackage{(.-)}%[%d%d%d%d%/%d%d%/%d%d version v%d%.%d+",
            "\\ProvidesPackage{%1}[" .. tagdate .. " version " .. packageversion)
        return content
    elseif string.match(file, "doc/*.tex$") then
        content = string.gsub(content, "\\date{Version v%d%.%d+ \\textendash\\ %d%d%d%d%/%d%d%/%d%d",
            "\\date{Version " .. packageversion .. " \\textendash{} " .. tagdate)
        return content
    end
    return content
end

-- committing retagged file and tag the commit =======================
-- build-private.lua (not in the repository) provides the github token and the
-- upload settings. It is only needed for tagging and uploading, not for 'l3build doc'.
local has_private = pcall(require, 'build-private')
token = token or ""
uploadconfig = uploadconfig or {}
if not has_private and (options["target"] == "tag" or options["target"] == "upload") then
    error("build-private.lua is missing: it has to define 'token' and 'uploadconfig' (author, uploader, email)")
end

function tag_hook(tagname)
    git("add", "*.sty")
    git("add", "doc/*.tex")
    os.execute("github_changelog_generator --user EagleoutIce --project \"" .. module .. "\" --token \"" .. token ..
                   "\" --future-release \"" .. packageversion .. "\"")
    git("add", "CHANGELOG.md")
    git("commit -m 'step version " .. packageversion .. "'")
    git("tag", packageversion)
end

-- collecting files for ctan =========================================
docfiledir = "./doc"
sourcefiledir = "./tex"

docfiles = {module .. "-doc.tex", "indexstyle.ist", "build/" .. module .. "-doc.pdf"}
indexstyle = {"doc/indexstyle.ist"}

textfiles = {"doc/README-ctan.md"}
ctanreadme = "doc/README-ctan.md"

installfiles = {"*.sty", "*.tex"}
sourcefiles = installfiles
unpackfiles = {}

excludefiles = {"sub_*"}

-- Release a TDS-style zip
packtdszip = false

-- Preserve structure for CTAN
flatten = true

-- configuring ctan upload ===========================================
uploadconfig = {
    author = uploadconfig.author,
    uploader = uploadconfig.uploader,
    email = uploadconfig.email,
    pkg = ctanpkg,
    version = packageversion .. " " .. packagedate,
    license = "lppl1.3c",
    summary = "Penguins with TikZ",
    ctanPath = "/graphics/pgf/contrib/" .. ctanpkg,
    repository = "https://github.com/EagleoutIce/" .. module,
    note = [[Uploaded automatically by l3build...]],
    bugtracker = "https://github.com/EagleoutIce/" .. module .. "/issues",
    support = "https://github.com/EagleoutIce/" .. module .. "/issues",
    announcement_file = "announcement.txt"
}

-- cleanup ===========================================================
cleanfiles = {module .. "-ctan.curlopt", module .. "-ctan.zip"}


-- Steps Required:

-- 0. Verify the documentation builds
-- 1. Run l3build check to verify
-- 2. Run l3build tag to create a new tag, changelog, and verify that the version in the docs updated too
-- 3. Rebuild the docs to be sure
-- 4. l3build ctan to build the archive
-- 5. rename the README-ctan to README within the archive
-- 6. Check that links are reachable.  
-- 'l3build doc' builds the documentation with doc/build-doc.sh. The examples of the
-- documentation are compiled in parallel there, and it needs xlistings (git submodule).
target_list.doc.func = function()
    if not fileexists("doc/xlistings/xlistings.sty") then
        print("Fetching the submodule doc/xlistings")
        if os.execute("git submodule update --init doc/xlistings") ~= 0 and not fileexists("doc/xlistings/xlistings.sty") then
            error("doc/xlistings is missing: run 'git submodule update --init'")
        end
    end
    local ok = os.execute("doc/build-doc.sh")
    return (ok == true or ok == 0) and 0 or 1
end

-- tests: 'l3build check' draws all the examples of the documentation and the body types ==
checkengines = {"pdftex"}
stdengine = "pdftex"
checkruns = 1
