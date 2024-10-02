# boringvm

boringvm is a lightweight, command-line-based virtual machine manager designed for managing qemu virtual machines. The tool is designed to simplify VM management tasks for users.

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

- create and manage vm images: easily create or delete virtual machine images.
- run vms with port forwarding: automatically assign available ports for ssh access and forward them to vms.
- list running vms: display currently running vms along with their corresponding forwarded ports.
- ssh access: ssh into running vms or copy ssh keys to them.
- graphical mode support: optionally run vms with graphical display support.

## Requirements

- python3
- qemu
- Linux or macOS
  
## Usage

The `boringvm` tool is operated via the command line. The general usage pattern is:

```bash
boringvm <command> [options]
```

### Commands

- `create`: Create a new virtual machine image.
- `run`: Start a virtual machine.
- `ps`: List all running virtual machines and their forwarded ports.
- `images`: List available VM images.
- `ssh`: SSH into a running virtual machine.
- `ssh-copy-id`: Copy the SSH key to a virtual machine.
- `stop`: Stop a running virtual machine.
- `rm`: Delete a VM image.

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

