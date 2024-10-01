# boringvm

boringvm is a lightweight, command-line-based virtual machine manager designed for managing qemu virtual machines. This tool allows users to create, run, stop, ssh into, and manage vm images and processes with minimal configuration.

## Install

Install boringvm by running this one-liner (on macOS run without sudo):

Linux:

```
curl -fsSL https://raw.githubusercontent.com/ericcurtin/boringvm/s/install.sh | sudo bash
```

macOS:

```
curl -fsSL https://raw.githubusercontent.com/ericcurtin/boringvm/s/install.sh | bash
```

## Features

- **create** a new vms image
- **run** a vms with various configurations
- **list** running vms and images
- **ssh** into running vms
- **stop** or **delete** a vm
- **copy ssh key** to a vm

## Requirements

- python3
- qemu installed on the system
- ssh utilities (`ssh`, `ssh-copy-id`)
  
## Usage

The `boringvm` tool is operated via the command line. The general usage pattern is:

```bash
boringvm <command> [options]
```

### Available Commands

#### List Running vms
Lists all currently running vms and the ports they are mapped to.

```bash
boringvm ps
```

#### List vm Images
Lists all available vm images, their modification times, and sizes.

```bash
boringvm images
```

#### Create a New vm
Creates a new vm image with a given name.

```bash
boringvm create <vm_name>
```

#### Run a vm
Runs a specified vm. You can optionally specify whether the vm should use a cdrom (.iso), whether it should have a graphical interface, or whether to run interactively.

```bash
boringvm run <vm_name> [--cdrom <path>] [--graphic] [-i]
```

Options:
- `--cdrom <path>`: Path to the cdrom image (.iso) to boot from.
- `--graphic`: Launches the vm with a graphical interface.
- `-i`: Runs the vm in interactive mode.

#### ssh into a running vm
ssh into a vm using its port mapping. Automatically detects the correct port based on the running vms.

```bash
boringvm ssh <vm_name>
```

#### Copy ssh key to a vm
Copies an ssh key to a running vm.

```bash
boringvm ssh-copy-id <vm_name>
```

#### Stop a running vm
Stops a vm by killing its associated process.

```bash
boringvm stop <vm_name>
```

#### Delete a vm
Deletes a vm image from the system.

```bash
boringvm rm <vm_name>
```

## Configuration

By default, boringvm stores vm images in:

- `/var/lib/boringvm/vms` (for root users)
- `~/.local/share/boringvm/vms` (for regular users)

## Example Usage

1. **Create a vm image**:
   ```bash
   boringvm create my_vm
   ```

2. **Run the vm** with a graphical interface and a cdrom:
   ```bash
   boringvm run my_vm --cdrom /path/to/cdrom.iso --graphic
   ```

3. **ssh into the running vm**:
   ```bash
   boringvm ssh my_vm
   ```

4. **Stop the vm**:
   ```bash
   boringvm stop my_vm
   ```

5. **Delete the vm image**:
   ```bash
   boringvm rm my_vm
   ```

Enjoy using boringvm to manage your virtual machines with ease!

