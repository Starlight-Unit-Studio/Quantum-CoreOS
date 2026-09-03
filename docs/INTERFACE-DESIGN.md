# Quantum CoreOS Interface Language

Status: planning baseline 0.1

Quantum CoreOS must look like a genuine continuation of the established terran interface language, not like a conventional desktop with a science-fiction theme layered on top.

## Core palette

```text
Black   space, background, rest
Blue    standard interface structure and navigation
White   information, labels and neutral data
Gold    focus, priority, privileged or exceptional activity
Green   nominal/online status where a binary health signal is needed
```

Gold is functional and deliberately sparse. It is not general decoration.

## Desktop composition

The desktop uses an almost pure black background.

Two asymmetric structural bars define the screen:

- a strong blue bar starts at the upper-left edge and ends shortly after the horizontal center
- a corresponding blue bar starts at the lower-right edge and ends shortly before the horizontal center

They are system surfaces, not conventional taskbars.

On both left and right screen edges, two very thin gold light rails move in opposite vertical directions. One travels upward while the other travels downward. The motion loops continuously, smoothly and without gaming-style RGB effects.

## Terran frames

Windows and controls use the same frame grammar visible in terran public information displays and Ren's GUI ring.

Characteristics:

- very thin luminous outlines
- mostly blue/cyan inactive and standard frames
- dark, near-black or lightly translucent content fields
- active or exceptional frames may shift toward gold/amber
- minimal chrome
- no conventional heavy title bars
- information is arranged as independent framed spaces rather than large opaque slabs

A focused window increases frame intensity rather than gaining a conventional desktop highlight.

## Window motion

Opening a window should feel constructed rather than simply faded in.

Reference motion:

1. the upper frame line draws across
2. side lines extend
3. the lower frame closes the shape
4. content resolves inside the completed frame

Closing reverses the sequence. Animation remains fast enough for daily use.

## Ren Matrix cursor

The canonical Ren Matrix is the basis of the Quantum CoreOS pointer.

The symbol itself is not redesigned. Cursor states animate existing layers of the matrix.

Planned states:

```text
normal      slow opposing orbit motion
hover       subtle blue response and slight expansion
click       short gold pulse from the center
busy        more visible counter-rotation of orbit layers
drag        secondary orbital response
forbidden   motion and luminosity reduce to a blocked state
AI action   controlled gold activity in the center/core
```

The central Ren symbol is the logical pointer hotspot.

The master vector asset is stored separately from generated platform cursor files.

## System surfaces

The upper structural bar may carry identity and workspace context such as:

```text
QUANTUM CORE // LOCAL
NODE
WORKSPACE
TIME
```

The lower structural bar may carry machine state such as:

```text
RUNTIME
GPU
NETWORK
AUDIO
POWER
NOTIFICATIONS
```

Neither bar should become a crowded clone of a conventional desktop panel.

## Launcher

The launcher extends from the structural frame language rather than displaying a grid of generic application icons.

Primary groups may include:

- Applications
- Files
- Communications
- Ember / AI
- Models
- Network
- System Control
- Settings

## Design lineage

The visual language is already represented by Starlight Unit public information/news monitors and terran GUI frames. Quantum CoreOS extends the same design grammar into a personal interactive desktop.

The intended relationship is therefore:

```text
terran public displays
terran GUI frames
CoreUI design lineage
        |
        v
Quantum CoreOS desktop shell
```

The desktop must never be reduced to `KDE/another desktop + blue borders + a space wallpaper`. The frame system, asymmetric screen geometry, motion language and Ren Matrix pointer are part of the interaction model itself.