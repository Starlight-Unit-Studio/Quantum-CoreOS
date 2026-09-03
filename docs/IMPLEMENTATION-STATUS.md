# Quantum CoreOS Implementation Status

Status date: 2026-09-03

Quantum CoreOS remains the final integration project. Active operating-system implementation has not started. The two reusable infrastructure projects now exist and have delivered their first executable foundations.

## Quantum Runtime

Repository: `Starlight-Unit-Studio/Quantum-Runtime`

Current foundation: `0.1.0-alpha.1`

Merged foundation capabilities:

- standalone Go service on loopback by default
- native liveness, readiness, version and capability endpoints
- constrained Ollama compatibility adapter
- chat, generation, embedding and model-read routes
- streaming, cancellation and timeout propagation
- body limits and structured request identifiers
- model mutation disabled by default
- bearer authentication required for non-loopback binding
- CoreUI-compatible request transport coverage
- automated formatting, vet, race, test and build verification

Current limitation:

Quantum Runtime does not yet perform independent native inference. The initial backend is an explicitly reported Ollama adoption adapter. This lets CoreUI and the Game begin using the Runtime service boundary while the native backend and model registry are developed independently.

Next tracked work:

- model manifest and registry contract v1alpha1
- hardened standalone Linux packaging
- optional Ember CoreUI adoption profile

## Quantum Control

Repository: `Starlight-Unit-Studio/Quantum-Control`

Current foundation: `0.1.0-alpha.1`

Merged foundation capabilities:

- separate unprivileged `quantum-control` API service
- separate `qcored` typed-operation broker
- protected Unix-socket transport and broker authentication
- loopback-only public API default
- mandatory bearer authentication for non-loopback binding
- typed operation catalog, planning and execution protocol
- read-only `system.snapshot` and `service.status` operations
- fixed systemd adapter without arbitrary shell input
- request and audit identifiers
- public redaction of internal broker transport failures
- OpenAPI, deployment and security documentation
- automated formatting, vet, race, test and build verification

Current limitation:

Quantum Control is not yet a complete KeyHelp replacement. The first release is deliberately read-only. No service mutation, domain, TLS, database, container, backup, restore or update operation exists until durable identity, authorization, confirmation, audit and rollback contracts are implemented.

Next tracked work:

- read-only component inventory
- ownership states `managed`, `external` and `disabled`
- durable actor, authorization and audit contracts before mutations

## CoreOS integration gate

CoreOS implementation begins only after independently released Runtime and Control versions satisfy the integration gates tracked in repository issue 2.

Required outcomes include:

- stable module APIs and compatibility policies
- standalone installation and upgrade paths
- proven Ember CoreUI integration
- proven component adoption behavior
- first transactional Control operation with health verification and rollback
- tested Runtime and Control compatibility matrix

## Permanent boundaries

- Ember CoreUI remains an independent Repack.
- Quantum Runtime remains model-neutral.
- The Quantum CoreOS TCI profile targets Gemma 4 e4b without making it the universal Runtime default.
- Quantum Control remains separate from AI inference.
- Quantum CoreOS consumes released upstream modules and does not maintain private forks.
- AI and TCI output never receives unrestricted root shell execution.
