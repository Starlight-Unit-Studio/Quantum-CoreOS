# Quantum CoreOS Architecture

Status: planning baseline 0.1

Quantum CoreOS is planned as an AI-first, Linux-based Unix-like operating system and platform. The real implementation does not claim UNIX certification. The fictional `Quantum-UNIX` name belongs to the Starlight Unit universe.

## Principles

- One distribution, modular services.
- No application gets unrestricted root access.
- AI inference and system administration stay separate.
- Existing external services can be adopted without being overwritten.
- CoreUI, Game, web apps and OS keep independent versions and lifecycles.
- Ember CoreUI remains permanently available as a standalone Repack for users who do not want Quantum CoreOS.
- Quantum Runtime and Quantum Control are independent upstream products, not internal CoreOS subsystems.
- Quantum CoreOS is built after those two modules are independently usable and stable.
- The native OS TCI is a Quantum CoreOS component, not a hidden dependency of Ember CoreUI.
- Updates must be transactional, verifiable and rollback-capable.

## Project topology

```text
Ember CoreUI
   |
   +---- optional Quantum Runtime integration
   +---- optional Quantum Control integration

Quantum Runtime   <------ standalone project/repository
        |
        +------------------------------+
                                       |
Quantum Control   <------ standalone project/repository
        |                              |
        +------------------------------+
                                       |
                               Quantum CoreOS
                                       |
                              +--------+--------+
                              |                 |
                         Quantum TCI       Quantum Shell
```

Quantum CoreOS consumes released Runtime and Control packages and adds OS-specific profiles, policy and integration. It does not absorb their source ownership and does not maintain private forks.

## Component model inside a CoreOS installation

```text
Quantum CoreOS
|
+-- Base System
|   +-- Linux kernel and Unix-like userland
|   +-- systemd, networking, storage
|   +-- GPU drivers and compute stack
|
+-- Quantum Control package
|   +-- domains, TLS, web services, PHP
|   +-- databases, containers, backups
|   +-- firewall, logs, health, updates
|
+-- qcored / Control privileged broker
|   +-- typed allowlisted operations
|   +-- authorization and audit
|
+-- Quantum Runtime package
|   +-- model lifecycle and inference API
|   +-- context and KV-cache management
|   +-- text, vision, audio and embeddings
|   +-- pluggable inference backends
|
+-- Quantum Scheduler
|   +-- GPU and VRAM allocation
|   +-- model residency and priorities
|
+-- Quantum TCI
|   +-- OS-native cognitive identity
|   +-- canonical Gemma 4 e4b target
|   +-- personality package and continuity
|   +-- typed context providers and actions
|
+-- Quantum Shell
|   +-- desktop shell and compositor integration
|   +-- windows, frames, notifications, launcher
|
+-- Applications
    +-- optional Ember CoreUI package
    +-- STΛRLIGHT UNIT The Game
    +-- Starlight Unit web applications
```

## Product independence

**Ember CoreUI remains a first-class standalone product and Repack.** Quantum CoreOS may ship an optimized package for it, but CoreUI itself must continue to install and run on supported non-Quantum operating systems and retain its own installer, versioning and release lifecycle.

Quantum Runtime and Quantum Control follow the same principle. They are independently installable modules that are useful before Quantum CoreOS exists.

This serves users who want the CoreUI stack or the infrastructure modules without replacing their operating system and prevents the OS project from becoming a prerequisite for the existing products.

See `PROJECT-BOUNDARIES.md` for repository and lifecycle rules.

## TCI layer

Quantum CoreOS contains its own system-wide Terran Cognitive Intelligence layer. The first canonical model target is Gemma 4 e4b, hosted through Quantum Runtime.

The TCI is intentionally separated from both the inference runtime and the privileged system broker:

```text
Gemma 4 e4b
    |
Quantum Runtime
    |
Quantum TCI
    |
+-- Quantum Shell
+-- notifications/search
+-- files and applications
+-- diagnostics
+-- Quantum Control requests
    |
Quantum Control/qcored only for typed privileged operations
```

The TCI carries a stable original personality package, identity and continuity across OS surfaces. Mutable user memories and live machine state remain outside the model recipe and are supplied through scoped services.

See `TCI.md` for the detailed model, personality and authorization plan.

## Quantum Control role

Quantum Control is the long-term KeyHelp replacement. In Quantum CoreOS it is a native first-class package, but it remains a separate upstream project and is neither part of the kernel nor part of Quantum Runtime.

Quantum Control owns machine and hosting administration. Quantum Runtime owns AI inference. Applications own their own data and product logic.

Privileged actions go through the Control broker. A UI or TCI requests a typed operation, for example:

```json
{
  "action": "domain.enable_tls",
  "domain": "core.example.org"
}
```

The broker validates caller, parameters and policy before making a system change. AI-generated text is never executed as a root shell command.

## Component ownership

Every dependency has one ownership state:

```text
managed   lifecycle, configuration and updates are managed by the active product profile.
external  detected and used, but never replaced or reconfigured implicitly.
disabled  not used by this installation.
```

This model is carried forward from the STΛRLIGHT UNIT Repack installer foundation and should be shared by Runtime, Control and CoreOS.

## Runtime compatibility

Quantum Runtime should initially support migration without forcing application rewrites:

1. Native Quantum Runtime API.
2. OpenAI-compatible surface where practical.
3. Ollama compatibility adapter for existing local integrations.
4. Pluggable inference backends rather than writing low-level GPU kernels from scratch in the first generation.

CoreUI and the Game should target a stable runtime contract instead of embedding assumptions about one model server.

## Security boundaries

1. AI processes never run as root.
2. AI output is never treated as a shell command.
3. Privileged operations are typed and allowlisted.
4. Destructive operations require explicit authorization and auditing.
5. Secrets never enter release archives, Git history or public logs.
6. Applications receive only required filesystem, network and device access.
7. Persistent state is backed up before risky migrations.
8. Updates use verification, health checks and rollback.
9. External components remain untouched until explicitly adopted.
10. GPU access is centrally schedulable.
11. TCI context providers expose only permission-scoped system information.
12. The TCI personality package never contains user secrets or live mutable state.
13. CoreOS-specific changes to Runtime or Control must go upstream through their repositories rather than living as hidden forks.

## Versioning

Quantum CoreOS, Quantum Control, Quantum Runtime, Quantum TCI, Quantum Shell, Ember CoreUI, STU Game and STU Repack keep independent version numbers. An OS release records a tested compatibility matrix instead of forcing all components to share one version.

## First practical targets

Active implementation order is:

```text
Quantum Runtime
      ↓
Quantum Control
      ↓
stable shared contracts
      ↓
Quantum CoreOS
```

The first CoreOS-specific work remains integration, the TCI, scheduler and shell after the two reusable upstream modules are ready. It is not a custom kernel and not yet a full ISO.