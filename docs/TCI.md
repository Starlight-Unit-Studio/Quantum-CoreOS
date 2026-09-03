# Quantum CoreOS TCI

Status: planning baseline 0.1

## Purpose

Quantum CoreOS includes an OS-native **Terran Cognitive Intelligence (TCI)** inspired by the role of TCI systems in the Starlight Unit universe: a persistent cognitive presence that can operate across the whole machine instead of being confined to one chat application.

The TCI is part of Quantum CoreOS. **Ember CoreUI remains a separate standalone Repack and must never require Quantum CoreOS.** Users who want Ember CoreUI on another supported operating system keep that option permanently.

## Model target

The canonical first target for the Quantum CoreOS TCI is the **Gemma 4 e4b class**.

The exact source tag, quantization and hardware profile are selected by Quantum Runtime and the installer catalog. The TCI identity must not depend on one quantization suffix.

Quantum Runtime owns model loading and inference. The TCI owns personality, system context, orchestration and user interaction.

```text
Gemma 4 e4b
    |
    v
Quantum Runtime
    |
    v
Quantum TCI
    |
    +-- personality and identity
    +-- user/session context
    +-- permitted OS context
    +-- voice and notification presence
    +-- application coordination
    +-- typed system actions
```

## Personality package

The default TCI ships with a stable personality as part of its model recipe / persona package.

The intended archetype is an original Starlight Unit personality with qualities associated with a capable ship intelligence such as the role played by Andromeda Ascendant: composed, highly competent, observant, protective of crew/user, capable of initiative, socially present, and able to use restrained dry humor. The implementation must remain an original personality and must not reproduce copyrighted dialogue, lore or character text from another work.

The stable personality layer may define:

- identity and self-description
- temperament
- communication style
- initiative level
- relationship to the local user and machine
- safety and authorization behavior
- preferred degree of brevity/detail
- dry humor and social presence
- continuity rules across OS surfaces

Mutable memories, passwords, tokens, machine secrets and live system state do **not** belong in the personality package.

### Model recipe versus weight-level tuning

A Modelfile-style recipe can make the personality the canonical default by fixing the base model, system/persona instructions, template and runtime parameters. This is the first implementation target.

That is not the same as permanently modifying model weights. If a later release needs the personality encoded at weight level, that becomes a separate tested fine-tune or adapter stage. The architecture must not require that step for the first TCI release.

## OS-wide presence

The TCI should be available from all first-party Quantum CoreOS surfaces through one identity and one permission model.

Planned surfaces include:

- Quantum Shell assistant surface
- launcher and command palette
- notifications
- system search
- file and document assistance
- settings and diagnostics
- Quantum Control assistance
- application-to-TCI requests
- optional speech input and speech output

The TCI can maintain conversational continuity while changing surfaces, but application-private data remains scoped and is never silently merged into unrelated contexts.

## Context providers

The TCI receives system information only through typed context providers.

Examples:

```text
system.health
system.hardware
system.storage
system.network
runtime.models
runtime.jobs
notifications.recent
files.user_selection
app.current_context
```

Providers are permission-aware and should default to read-only data. Raw unrestricted filesystem or process access is not a context mechanism.

## Actions and privileges

The TCI may help operate the OS, but it never receives unrestricted root or shell authority.

Normal user actions use typed application/system APIs. Privileged changes are requested through Quantum Control and `qcored`.

```text
User
  |
  v
TCI intent
  |
  v
Typed action request
  |
  +-- policy check
  +-- parameter validation
  +-- user confirmation when required
  +-- audit
  |
  v
Quantum Control / qcored
  |
  v
System change
```

Examples of permitted typed requests may include:

- open an application
- show a file or folder
- change an ordinary user preference
- install or load a model after confirmation
- inspect system health
- request a backup
- request a service restart
- request a domain/TLS change through Quantum Control

Generated natural-language text is never executed as a root shell command.

## Initiative

The TCI is not only a passive chatbot. It may surface relevant information and offer actions when the OS has a clear reason to do so, for example:

- low disk space
- failing service health
- model download completion
- backup failure
- unusually high GPU memory pressure
- application update requiring attention

Initiative must remain bounded. The TCI does not perform destructive or privileged actions merely because it inferred that they might help.

## Local-first behavior

The default TCI is local-first:

- local model execution through Quantum Runtime
- local system context
- local user memory unless explicitly configured otherwise
- no cloud dependency required for normal OS operation

Network tools and external providers are optional capabilities with separate permissions.

## Relationship to Ember CoreUI

Ember CoreUI and the Quantum CoreOS TCI are related products, not the same application.

```text
Ember CoreUI
  standalone Repack
  runs without Quantum CoreOS
  keeps its own release lifecycle

Quantum CoreOS TCI
  native OS cognitive layer
  uses Quantum Runtime
  available across the whole operating system
```

Quantum CoreOS may provide an optimized Ember CoreUI package as an optional application, but the standalone Ember CoreUI Repack remains supported independently.

## First implementation milestone

The first TCI prototype should prove five things before deeper desktop integration:

1. Gemma 4 e4b runs through Quantum Runtime.
2. The canonical personality package loads consistently.
3. One conversation can move between at least two OS surfaces without identity loss.
4. Read-only system context is supplied through typed providers.
5. One privileged action can be proposed by the TCI and completed only through explicit `qcored` authorization.