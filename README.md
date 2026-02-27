# Ti*k*Zpingus

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/) [![PR's Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat)](http://makeapullrequest.com)  [![CTAN](https://img.shields.io/ctan/v/tikzpingus.svg)](https://www.ctan.org/pkg/tikzpingus) [![build](https://github.com/EagleoutIce/tikzpingus/actions/workflows/compile.yaml/badge.svg)](https://github.com/EagleoutIce/tikzpingus/actions/workflows/compile.yaml)

This package allows you to typeset (cute) little penguins in LaTeX with PGF/Ti*k*Z.
The [documentation](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/doc/build/tikzpingus-doc.pdf) contains a reference for all currently available options. See the examples below for a quick overview.

<div style="text-align:center">

[<img src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/minimal-1.png?raw=true" width="600" alt="The current minimal penguin test."/>](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/minimal.pdf)
</div>

----

Ti*k*Zpingus is actively developed by *Florian Sihler* (contact me at: <florian.sihler@uni-ulm.de>) under the [LPPL Version 1.3c](LICENSE) (please note that this changed on 2026-02-27 from GPL&nbsp;v3, versions **after** v1.3 are licensed with LPPL 1.3c). I am very happy about every contribution (see [CONTRIBUTING.md](CONTRIBUTING.md)).

> [Bonfert](https://www.michael-bonfert.de): "Leslie Lamport did you see that coming when working on LaTeX?"\
> Lamport: "Can't say that I did" ([source](https://www.youtube.com/watch?v=r28AwZQEDsQ&t=2599s))

----
<br />

<div style="text-align:center">

<!-- While GitHub will cleanse the border-radius, I keep it for the future. -->
[<img style="border-radius:8pt" src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-1.png?raw=true" width="600" alt="A happy penguin, waving its right wing." />](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=1)
</div>

The purpose of this library is to produce one thing: cute penguins. Using the `\pingu`-macro, you can pass an arbitrary amount of options to endow the penguin with many extras or change its complete appearance. Furthermore, most options allow additional arguments, defining the color, text, ...
<br />

<div style="text-align:center">

[<img style="border-radius:8pt" src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-2.png?raw=true" width="600" alt="A small penguin with hat and cup" />](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=2)
</div>

While the [documentation](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/doc/build/tikzpingus-doc.pdf) contains a reference of all options that are available (or at least, that is the plan), most extras should be named relatively intuitive. For example, if you want a small penguin, you add the option `small`.
If the penguin should be large, you write `large`. If you want the penguin to hold a cup, you write `cup`. If the cup should have a specific color, like blue, you add this via `cup=blue`, ...
<br />

<div style="text-align:center">

[<img style="border-radius:8pt" src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-3.png?raw=true" width="600" alt="A santa-looking penguin with beard, eye patch, santa hat and cane." />](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=3)
</div>

Currently, most options I have added arose from concrete situations and are not part of "sets". However, some sets do exist, like the `santa` or `devil` collection. If there are more sets in the future, I might add them as first-class components. For now, the [documentation](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/doc/build/tikzpingus-doc.pdf#appendix.A) contains an [overview](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/doc/build/tikzpingus-doc.pdf#appendix.A) of the larger gadgets.
<br />

<div style="text-align:center">

[<img style="border-radius:8pt" src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-4.png?raw=true" width="600" alt="A technical penguin with lightsaber, laptop, vr headset, and headphones." />](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=4)
</div>

If you just load the library by `\usepackage{tikzpingus}` all options will work, and you might want to use the `glows`-option (`\usepackage[glows]{tikzpingus}`) so that lightsabers and other glowing elements look waaay nicer (but may produce artifacts in some pdf-viewers).
<br />

<div style="text-align:center">

[<img style="border-radius:8pt" src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-5.png?raw=true" width="600" alt="A shocked penguin with a cake on the hat, mask, and a figurine horse in the right wing." />](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=5)
</div>

Not all gadgets and wing positions work together. While I try to get as many of them working as possible, selecting two different styles of glasses or hats probably looks weird, no matter what code I add.
Nonetheless, there is code implemented to deal with a lot of interactions (e.g., items in different wings, multiple items on the hat, ...), and there are several options to cope with them yourself if the need arises.
Oh, and by the way, when options are named with `left` and `right` they are always from the penguin perspective.
<br />

<div style="text-align:center">

[<img style="border-radius:8pt" src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-6.png?raw=true" width="600" alt="A crowned penguin with sunglasses, gold medal, and a golden glow." />](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=6)
</div>

Clothes are a work in progress for a long time now. While there are pants, shirts, a cape, and a cloak, they interfere with body types and other interaction codes. They work quite well for "not-too-fancy" and exotic combinations, but for more complex scenarios, I just had no time (for now). So feel free to wrap your head around that and open a PR! I would be happy to assist you!

## Testing Files

These are some test files that showcase additional capabilities of the library:\
[<img src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/preview-1.png?raw=true" width="600" alt="A test file of many penguins." />](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/showcase.pdf)

For the title image of a computer science course on software product lines, I created a small and incomplete but really fun feature model:\
[<img src="https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/spl-1.png?raw=true" width="900" alt="A Penguin Feature-Model" />](https://raw.githubusercontent.com/EagleoutIce/tikzpingus/gh-pages/examples/build/spl.pdf)

## Contributors

<a href="https://github.com/eagleoutice/tikzpingus/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=eagleoutice/tikzpingus" alt="Contributor Information" />
</a>

Made with [contrib.rocks](https://contrib.rocks).
