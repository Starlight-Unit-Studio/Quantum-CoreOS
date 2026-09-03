# Quantum Project Boundaries

Status: planning baseline 0.1

Quantum CoreOS is the final integration project. It must not become the development home of Quantum Runtime or Quantum Control.

## Independent repositories

The intended project split is:

```text
Starlight-Unit-Studio/coreui
    Ember CoreUI

Starlight-Unit-Studio/Quantum-Runtime
    standalone AI runtime and model service

Starlight-Unit-Studio/Quantum-Control
    standalone Linux/server administration platform

Starlight-Unit-Studio/Quantum-CoreOS
    final operating-system integration
```

Quantum Runtime and Quantum Control are first-class products with their own repositories, installers, versions, releases, tests and compatibility policies.

## Quantum Runtime

Quantum Runtime is developed before Quantum CoreOS and must work on supported existing Linux installations.

Primary consumers include:

- Ember CoreUI
- STΛRLIGHT UNIT Game/Repack
- later Quantum CoreOS
- other local applications using its documented API

Quantum CoreOS consumes a released Quantum Runtime package and may apply an OS-specific profile, service policy, GPU policy and integration defaults. CoreOS must not maintain a private fork of Runtime.

## Quantum Control

Quantum Control is developed before Quantum CoreOS and must also work as a standalone Linux/server management platform.

It is the long-term KeyHelp replacement for the Starlight stack, but is not tied to one OS image.

Primary responsibilities include:

- services and logs
- domains and reverse proxy
- TLS
- databases
- containers
- firewall
- backups and restore
- application deployment
- update orchestration
- hardware and runtime status

Quantum CoreOS consumes a released Quantum Control package and supplies deeper native integration through documented adapters and policies. CoreOS must not duplicate Control logic inside the shell.

## Ember CoreUI remains independent

Ember CoreUI remains a standalone Repack for users who do not want Quantum CoreOS.

CoreUI may use Quantum Runtime and selected Quantum Control capabilities when installed, but neither Quantum project may become a mandatory dependency unless a specific CoreUI installation profile explicitly selects it.

Existing Ollama or externally managed infrastructure remains supportable through compatibility/adoption modes during migration.

## Build order

The project order is intentionally:

```text
1. shared contracts
2. Quantum Runtime
3. Quantum Control
4. stabilize Runtime + Control integration contracts
5. Quantum CoreOS integration
6. Quantum TCI and Shell on top of the released modules
7. Server/Desktop/Workstation images
```

The OS is therefore built last, once its two major reusable infrastructure modules already exist and are independently testable.

## Integration rule

Quantum CoreOS performs integration, packaging and OS-specific optimization. It does not absorb ownership of the independent projects.

Examples of OS-specific optimization include:

- native systemd/service profiles
- GPU scheduling policy
- preconfigured local IPC where appropriate
- hardened permissions and sandboxing
- common health reporting
- unified update coordination
- shared desktop/system-control surfaces
- TCI context and action adapters

The same upstream Runtime and Control releases must remain usable outside Quantum CoreOS.

## Versioning

Every project keeps independent semantic/product versioning.

A Quantum CoreOS release records a tested compatibility matrix, for example:

```text
Quantum CoreOS      0.x
Quantum Runtime     0.x
Quantum Control     0.x
Quantum TCI profile 0.x
Ember CoreUI        independent
STU Repack          independent
```

No synchronized version-number scheme is required.