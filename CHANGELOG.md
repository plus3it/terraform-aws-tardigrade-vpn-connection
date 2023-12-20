## terraform-aws-tardigrade-vpn-connection Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

### [3.0.1](https://github.com/plus3it/terraform-aws-tardigrade-vpn-connection/releases/tag/3.0.1)

**Released**: 2023.12.20

**Summary**:

*   Creates customer gateway before destroying old one to fix issues when changes
    require recreation
*   Requires minimum terraform aws provider 5.31.0 to support `log_group_class`
    attribute on cloudwatch log group

### 3.0.0

**Released**: 2023.12.09

**Commit Delta**: [Change from 1.0.2 release](https://github.com/plus3it/terraform-aws-tardigrade-vpn-connection/compare/1.0.2...3.0.0)

**Summary**:

*   Completely refactors module to support all VPN Connection options and target
    types, including VPN Gateway and Transit Gateway

### 1.0.2

**Released**: 2019.10.28

**Commit Delta**: [Change from 1.0.1 release](https://github.com/plus3it/terraform-aws-tardigrade-vpn-connection/compare/1.0.1...1.0.2)

**Summary**:

*   Pins tfdocs-awk version
*   Updates documentation generation make targets
*   Adds documentation to the test modules

### 1.0.1

**Released**: 2019.10.04

**Commit Delta**: [Change from 1.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-vpn-connection/compare/1.0.0...1.0.1)

**Summary**:

*   Update testing harness to have a more user-friendly output
*   Update terratest dependencies

### 1.0.0

**Released**: 2019.09.16

**Commit Delta**: [Change from 0.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-vpn-connection/compare/0.0.0...1.0.0)

**Summary**:

*   Upgrade to terraform 0.12.x
*   Add test cases

### 0.0.0

**Commit Delta**: N/A

**Released**: 2019.08.22

**Summary**:

*   Initial release!
