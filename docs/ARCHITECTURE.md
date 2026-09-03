# Quantum CoreOS Architecture

Status: planning baseline 0.1

Quantum CoreOS is planned as an AI-first, Linux-based Unix-like operating system and platform. The real implementation does not claim UNIX certification. The fictional `Quantum-UNIX` name belongs to the Starlight Unit universe.

## Principles

- One distribution, modular services.
- No application gets unrestricted root access.
- AI inference and system administration stay separate.
- Existing external services can be adopted without being overwritten.
- CoreUI, Game, web apps and OS keep independent versions and lifecycles.
- Updates must be transactional, verifiable and rollback-capable.

## Component model

```text
Quantum CoreOS
|
+-- Base System
|   +-- Linux kernel and Unix-like userland
|   +-- systemd, networking, storage
|   +-- GPU drivers and compute stack
|
+-- Quantum Control
|   +-- domains, TLS, web services, PHP
|   +-- databases, containers, backups
|   +-- firewall, logs, health, updates
|
+-- qcored
|   +-- privileged system broker
|   +-- typed allowlisted operations
|   +-- authorization and audit
|
+-- Quantum Runtime
|   +-- model lifecycle and inference API
|   +-- context and KV-cache management
|   +-- text, vision, audio and embeddings
|   +-- pluggable inference backends
|
+-- Quantum Scheduler
|   +-- GPU and VRAM allocation
|   +-- model residency and priorities
|
+-- Quantum Shell
|   +-- desktop shell and compositor integration
|   +-- windows, frames, notifications, launcher
|
+-- Applications
    +-- Ember CoreUI
    +-- STΛRLIGHT UNIT The Game
    +-- Starlight Unit web applications
```

## KeyHelp replacement

The KeyHelp replacement is **Quantum Control**. It is part of the OS distribution, but not part of the kernel and not part of the AI runtime.

Quantum Control owns machine and hosting administration. Quantum Runtime owns AI inference. Applications own their own data and product logic.

Privileged actions go through `qcored`. The UI requests a typed operation, for example:

```json
{
  "action": "domain.enable_tls",
  "domain": "core.example.org"
}
```

`qcored` validates caller, parameters and policy before making a system change. AI-generated text is never executed as a root shell command.

## Component ownership

Every dependency has one ownership state:

```text
managed   Quantum CoreOS owns lifecycle, configuration and updates.
external  Detected and used, but never replaced or reconfigured implicitly.
disabled  Not used by this installation.
```

This model is carried forward from the STΛRLIGHT UNIT Repack installer foundation.

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

## Versioning

Quantum CoreOS, Quantum Control, Quantum Runtime, Quantum Shell, Ember CoreUI, STU Game and STU Repack keep independent version numbers. An OS release records a tested compatibility matrix instead of forcing all components to share one version.

## First practical target

The first practical CoreOS work is contracts, package boundaries and a prototype shell. It is not a custom kernel and not yet a full ISO.