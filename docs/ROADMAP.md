# Quantum CoreOS Roadmap

Status: planning baseline 0.1

## Phase 0: Contracts while current projects continue

CoreUI, Game, homepages and the first Repack continue in parallel.

Ember CoreUI remains an independent standalone Repack throughout the Quantum CoreOS project. Quantum CoreOS can provide an optimized package for it, but users never need to replace their operating system just to use CoreUI.

Define shared contracts before changing their architecture:

- component ownership: `managed`, `external`, `disabled`
- runtime API v1
- health API
- component manifest
- secrets layout
- backup and restore contract
- application package metadata
- compatibility matrix
- TCI context-provider contract
- typed action contract

Goal: future Runtime, Control and OS can replace existing infrastructure without rewriting the applications.

## Phase 1: Quantum Runtime

Build the Ollama replacement as an independent service.

Initial scope:

- model install/list/load/unload
- streaming chat API
- context management
- GPU/CPU selection
- model keep-alive
- cancellation and timeouts
- embeddings
- vision and audio capability registration
- OpenAI-compatible adapter
- Ollama compatibility adapter
- initial pluggable inference backend

CoreUI and Game should be able to switch between external Ollama and managed Quantum Runtime.

The first canonical Quantum CoreOS TCI model target is Gemma 4 e4b. Exact source tag and quantization remain hardware-profile decisions rather than personality identity.

## Phase 2: Quantum TCI prototype

Build the OS-native Terran Cognitive Intelligence on top of Quantum Runtime before deep shell integration.

The prototype validates:

- Gemma 4 e4b through Quantum Runtime
- canonical model recipe/personality package
- original capable ship-intelligence style personality
- identity continuity across at least two OS surfaces
- read-only typed system context providers
- user/session scoped memory
- optional speech input/output hooks
- bounded initiative for health, updates and runtime events
- one privileged action proposed by TCI but completed only through explicit `qcored` authorization

The TCI is a system cognitive layer, not a root shell and not an Ember CoreUI replacement.

## Phase 3: Quantum Scheduler

Centralize AI resource management:

- GPU and VRAM accounting
- model residency
- request queues and priorities
- resource limits per application
- shared model process where safe
- independent application contexts and personalities
- TCI priority class and responsiveness targets

## Phase 4: Quantum Control

Build the OS-native KeyHelp replacement as a separate service and UI:

- service status and logs
- domains and reverse proxy
- TLS certificates
- PHP runtimes
- MariaDB/PostgreSQL management
- containers and volumes
- firewall controls
- backups and restore
- update management
- application install/update/remove
- hardware and GPU status

All privileged actions go through `qcored` with typed operations and audit records. The TCI may explain and propose these operations, but never bypass their authorization policy.

## Phase 5: Quantum Shell prototype

Create a desktop-shell prototype before creating a distribution image.

The prototype must validate:

- black desktop space
- asymmetric blue top and bottom system bars
- animated gold side rails
- terran frame/window language
- focus and active-state colors
- Ren Matrix cursor states
- launcher
- notifications
- system control surfaces
- native TCI presence across shell surfaces
- optional Ember CoreUI desktop application

The first prototype may run on an existing Linux desktop/compositor. The design and interaction model matter before distro packaging.

## Phase 6: CoreOS Server image

Produce the first clean-server installation target:

- minimal Linux base
- Quantum Control
- Quantum Runtime
- Quantum TCI service profile where selected
- Scheduler
- database and web stack
- application package manager
- health and rollback
- guided hardware/GPU detection

Target experience:

```text
install base system
select CoreOS Server
create admin account
configure networking/domain
select AI runtime profile
install
reboot
open Quantum Control
```

## Phase 7: Desktop and Workstation editions

Desktop:

- Quantum Shell
- system-wide TCI
- file management
- browser integration
- settings and networking
- audio/Bluetooth/display integration
- optional CoreUI desktop application

Workstation adds development tools and local server services.

Server, Desktop and Workstation share the same service contracts.

## Phase 8: Native distribution hardening

Only after the stack is stable:

- reproducible image builds
- signed package/release metadata
- recovery environment
- atomic or image-based update exploration
- secure boot strategy
- installer media
- long-term hardware compatibility policy

## Explicit non-goals for early releases

- writing a custom kernel
- implementing a full inference engine from low-level GPU kernels
- cloning every feature of a general shared-hosting panel
- coupling CoreUI or the Game to one CoreOS release
- requiring Quantum CoreOS to use Ember CoreUI
- giving AI unrestricted shell/root access
- storing mutable user secrets or live machine state inside the TCI model recipe

## Parallel development rule

Quantum CoreOS must not block current production work. CoreUI, Game/Homepages and Repack remain first-class independent projects while their interfaces gradually converge on the shared CoreOS contracts.