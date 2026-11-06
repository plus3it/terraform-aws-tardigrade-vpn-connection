# Agent Instructions

Before starting any task in this repository:

1. Run `make agents/sync`. It writes the shared Plus3 IT instructions for this repository's tardigrade-ci version to `.agents/plus3it/AGENTS.md`.
2. Read `.agents/plus3it/AGENTS.md` and follow it together with this file. If the sync fails, tell the user, and don't guess the conventions.

These rules always apply, even without the shared instructions:

- Don't push, open pull requests, publish releases, or apply infrastructure changes unless the user asks. List those steps for a person in your final report.
- Don't edit files under `.agents/plus3it/`; they are generated and overwritten by the sync.

@.agents/plus3it/AGENTS.md

## Repository-specific

### Purpose

This Terraform module creates one AWS Site-to-Site VPN connection and its customer gateway. The main input is `vpn_connection`, an object that sets the connection (to a transit gateway or a virtual private gateway), the customer gateway, per-tunnel options, static routes, and transit gateway route table association and propagations. It can also create a CloudWatch log group for each tunnel's logs. The module outputs `vpn_connection` and `customer_gateway`.

### Module-specific files

- `modules/vpn-gateway/` — Submodule that creates a virtual private gateway and its route propagations. It calls the root module once for each item in `vpn_connections` and attaches each connection to the new gateway; consumers call this submodule directly, and the root module does not call it. The `tests/` scenarios exercise this submodule.
