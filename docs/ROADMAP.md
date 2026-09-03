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

Goal: Quantum Runtime and Quantum Control become reusable standalone products first. Quantum CoreOS integrates their stable releases later without rewriting them.

## Phase 1: Quantum Runtime standalone project

Build Quantum Runtime in its own repository as the Ollama replacement and general local AI service.

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

CoreUI and Game should be able to switch between external Ollama and Quantum Runtime without requiring Quantum CoreOS.

The first canonical future Quantum CoreOS TCI model target is Gemma 4 e4b. Exact source tag and quantization remain hardware-profile decisions rather than personality identity.

## Phase 2: Quantum Control standalone project

Build Quantum Control in its own repository as the reusable Linux/server administration platform and long-term KeyHelp replacement.

Initial scope:

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
- typed privileged-operation broker and audit model

Quantum Control must work on supported existing Linux/server installations before Quantum CoreOS exists.

CoreUI, the STU Repack and other deployments may integrate selected Control capabilities without becoming dependent on Quantum CoreOS.

## Phase 3: Runtime and Control stabilization

Before OS implementation, stabilize the reusable module contracts:

- Runtime API v1
- Control API v1
- common health/status contract
- component ownership/adoption behavior
- package and release verification
- backup and rollback contracts
- OS adapter boundaries
- tested CoreUI integration
- tested STU Repack integration where applicable

The output of this phase is a compatibility matrix of independently released Quantum Runtime and Quantum Control versions.

## Phase 4: Quantum CoreOS integration foundation

Only after Runtime and Control are independently usable does active OS implementation begin.

Quantum CoreOS consumes released upstream packages and adds OS-specific integration:

- native service profiles
- hardened permissions and sandboxing
- common logging and health aggregation
- unified update coordination
- local IPC optimizations where useful
- GPU/resource policies
- OS package profiles

CoreOS does not maintain private forks of Quantum Runtime or Quantum Control.

## Phase 5: Quantum Scheduler and TCI

Build the OS-native coordination and cognitive layers on top of the released Runtime and Control modules.

Quantum Scheduler:

- GPU and VRAM accounting
- model residency
- request queues and priorities
- resource limits per application
- shared model process where safe
- independent application contexts and personalities
- TCI priority class and responsiveness targets

Quantum TCI prototype:

- Gemma 4 e4b through Quantum Runtime
- canonical model recipe/personality package
- original capable ship-intelligence style personality
- identity continuity across OS surfaces
- read-only typed system context providers
- user/session scoped memory
- optional speech input/output hooks
- bounded initiative for health, updates and runtime events
- privileged actions completed only through Quantum Control/qcored authorization

The TCI is a system cognitive layer, not a root shell and not an Ember CoreUI replacement.

## Phase 6: Quantum Shell prototype

Create the desktop shell after the reusable services and TCI contracts exist.

The prototype must validate:

- black desktop space
- asymmetric blue top and bottom system bars
- animated gold side rails
- terran frame/window language
- focus and active-state colors
- Ren Matrix cursor states
- launcher
- notifications
- system control surfaces backed by Quantum Control
- native TCI presence across shell surfaces
- optional Ember CoreUI desktop application backed by Quantum Runtime

The first prototype may run on an existing Linux desktop/compositor. The design and interaction model matter before distro packaging.

## Phase 7: CoreOS Server image

Produce the first clean-server installation target using the already released modules:

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

## Phase 8: Desktop and Workstation editions

Desktop:

- Quantum Shell
- system-wide TCI
- file management
- browser integration
- settings and networking
- audio/Bluetooth/display integration
- optional CoreUI desktop application

Workstation adds development tools and local server services.

Server, Desktop and Workstation share the same Runtime and Control releases and service contracts.

## Phase 9: Native distribution hardening

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
- making Quantum Runtime or Quantum Control OS-only
- maintaining private CoreOS forks of Runtime or Control
- giving AI unrestricted shell/root access
- storing mutable user secrets or live machine state inside the TCI model recipe

## Parallel development rule

Quantum CoreOS must not block current production work. CoreUI, Game/Homepages and Repack remain first-class independent projects. Quantum Runtime and Quantum Control are developed and proven independently before the OS is implemented around them.