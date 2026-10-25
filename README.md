# Fontra Tutorials

Guided tours and hands-on lessons inside the [Fontra](https://fontra.xyz)
editor, as a plug-in anyone can add by address. A **tour** shows you around,
bubble by bubble; a **lesson** waits until you have done each step.

| Tutorial | | |
|---|---|---|
| Around the editor | tour | 2 min |
| Your first font | lesson | 20 min — an H, an o, a Weight axis, a TTF |
| Font info and designspace | tour | 4 min |
| The font overview | tour | 2 min |
| Coming from Glyphs | tour | 3 min |
| Coming from RoboFont | tour | 3 min |

The lesson follows the same steps and values as [Your first variable font](https://docs.fontra.xyz)
in the documentation: the long text stays there, the lesson keeps the
gestures.

## Adding it to Fontra

1. In Fontra, open the Fontra menu › **Application settings** › **Plugins**.
2. Add the address `fontra/fontra-tutorials`
   (or `https://fontra.github.io/fontra-tutorials`).
3. Reload the editor. A **Tutorials** panel appears in the right sidebar,
   and the tour of the editor is offered the first time.

`owner/repo` addresses are served by jsDelivr from the repository's latest
tagged release, so a new tag publishes a new version; the GitHub Pages
address follows `main` on every push (`.github/workflows/pages.yml`).

Fontra Pak and any Fontra server work the same way. Fontra loads plug-ins
in the glyph editor only: a step that belongs to Font Info or the font
overview is shown in the editor, centred, and says where to go; the lesson
still sees what you did there, because the editor shares the font with
those pages.

## Files

| File | What it is |
|---|---|
| `plugin.json` | the manifest Fontra reads: `init.js`, function `init` |
| `init.js` | `init(editor, pluginPath)`: adds the panel, offers the first tour |
| `panel.js` | the Tutorials panel: the list, where you are in each, Start over |
| `tour.js` | the mechanism: bubble, ring, placement, Back / Next, `until` polling, what is remembered (`localStorage["fontra.tutorials"]`) |
| `tours/index.js` | the list of tours, and the rules for writing a step |
| `tours/lib.js` | helpers for a lesson's `until`: glyphs, axes, sources, contours |
| `tours/*.js` | one file per tour |
| `test/` | a mock of the editor's page and a Playwright test |

Anchors are Fontra's ids and `data-*` attributes (`#edit-canvas`,
`#edit-tools .tool-button[data-tool=…]`, `.sidebar-tab[data-sidebar-name=…]`),
never its words, which are translated. A step whose anchor is absent is
left out. The plug-in imports nothing from Fontra: it works on the `editor`
object it is given (see *Writing your own plug-ins* in the documentation).

## Developing

```
python -m http.server 8123        # at the repository's root
pytest test/test_plugin.py        # pip install playwright pytest; playwright install chromium
```

To try it in a real Fontra from a source checkout: copy the folder to
`src/fontra/localplugins/fontra-tutorials` and add the address
`/localplugins/fontra-tutorials`; tick *Disable cache* in the browser's
developer tools while editing (Fontra serves its static files with a
start-up date).

## Origin and license

The mechanism and the first tours come from the tutorials of
[Try Fontra](https://try.fontrahive.com), the browser-only Fontra of
[Fontra Hive](https://fontrahive.com), where they also cover Hive's history,
branches and comments. GPLv3, © 2026 Jérémie Hornus / U+Type.
