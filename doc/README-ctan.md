# Ti*k*Zpingus

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/) [![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/GPL-3.0) [![PR's Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat)](http://makeapullrequest.com)  [![CTAN](https://badgen.net/badge/On/CTAN/cyan)](https://www.ctan.org/pkg/tikzpingus) [![build](https://github.com/EagleoutIce/tikzpingus/actions/workflows/compile.yaml/badge.svg)](https://github.com/EagleoutIce/tikzpingus/actions/workflows/compile.yaml)

This package is a work-in-progress package allowing you to typeset little penguins in LaTeX with PGF/Ti*k*Z.
The [documentation](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/doc/build/tikzpingus-doc.pdf) will constantly evolve.

----

Ti*k*Zpingus is actively developed by *Florian Sihler* (contact me at: <florian.sihler@uni-ulm.de>) under the [GPLv3 License](LICENSE). I am very happy about every contribution (see [CONTRIBUTING.md](CONTRIBUTING.md)).

----

[![Penguin Hey](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-1.png?raw=true)](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=1)

The purpose of this library is to produce one thing: cute penguins. Using the `\pingu`-macro, you can pass an arbitrary amount of options to endow the penguin with many extras or change its complete appearance. Furthermore, most options allow additional arguments, defining the color, text, ...

[![Penguin Hat](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-2.png?raw=true)](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=2)

While the [documentation](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/doc/build/tikzpingus-doc.pdf) contains a reference of all options that are available (or at least, that is the plan), most extras should be named relatively intuitive. For example, if you want a small penguin, you add the option `small`.
If the penguin should be large, you write `large`. If you want the penguin to hold a cup, you write `cup`. If the cup should have a specific color, like blue, you add this via `cup=blue`, ...

[![Penguin Santa](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-3.png?raw=true)](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=3)

Currently, most options I have added arose from concrete situations and are not part of "sets". However, some sets do exist, like the `santa` or `devil` collection. If there are more sets in the future, I might add them as first-class components. For now, the [documentation](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/doc/build/tikzpingus-doc.pdf#appendix.A) contains an [overview](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/doc/build/tikzpingus-doc.pdf#appendix.A) of the larger gadgets.

[![Penguin Tech](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-4.png?raw=true)](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=4)

If you just load the library by `\usepackage{tikzpingus}` all options will work, and you might want to use the `glows`-option (`\usepackage[glows]{tikzpingus}`) so that lightsabers and other glowing elements look waaay nicer (but may produce artifacts in some pdf-viewers). However, if loading the library takes too long for you, using the `bare` option will drastically reduce the default options available while allowing you to load specific libraries with `\pinguloadlibraries{<list of libraries>}`.

[![Penguin Cake](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-5.png?raw=true)](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=5)

Not all gadgets and wing positions work together. While I try to get as many of them working as possible, selecting two different styles of glasses or hats probably looks weird, no matter what code I add.
Nonetheless, there is code implemented to deal with a lot of interactions (e.g., items in different wings, multiple items on the hat, ...), and there are several options to cope with them yourself if the need arises.
Oh, and by the way, when options are named with `left` and `right` they are always from the penguin-perspective.

[![Penguin Crown](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/hey-pingu-6.png?raw=true)](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/examples/build/hey-pingu.pdf#page=6)

Clothes are a work in progress for a long time now. While there are pants, shirts, a cape, and a cloak, they interfere with body types and other interaction codes. They work quite well for "not-too-fancy" and exotic combinations, but for more complex scenarios, I just had no time (for now). So feel free to wrap your head around that and open a PR! I would be happy to assist you!

## More Fun

For the title image of a computer-science course on software-product-lines, I created a small and incomplete but really fun feature model:

[![Penguin-SPL](https://github.com/EagleoutIce/tikzpingus/blob/gh-pages/spl-1.png?raw=true)](https://media.githubusercontent.com/media/EagleoutIce/tikzpingus/gh-pages/examples/build/spl.pdf)
