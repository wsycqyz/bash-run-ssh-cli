# SSH Route Check Script

This repository contains a bash script to automate the process of SSH-ing into multiple devices, running a route check script, and reporting any devices with issues.

## Prerequisites

- `sshpass` needs to be installed on your local machine. You can install it using:
  ```sh
  sudo apt-get install sshpass
  ```

- Ensure that `python3` is installed on the remote devices and that the `route_check.py` script is accessible in the user's PATH on those devices.

## Files

- `check_devices.sh`: The bash script that reads device names from `host.txt`, SSH-es into each device, runs `route_check.py`, and reports any devices with issues.
- `host.txt`: A text file containing a list of device names, each on a new line.

## Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/wsycqyz/bash-run-ssh-cli.git
   cd bash-run-ssh-cli
   ```

2. **Edit the `host.txt` file**:
   Add your device names, each on a new line. For example:
   ```
   host01
   host02
   ```

3. **Edit SSH credentials in the script**:
   Update the `user` and `password` variables in `check_devices.sh` with your SSH username and password.

4. **Make the script executable**:
   ```sh
   chmod +x check_devices.sh
   ```

5. **Run the script**:
   ```sh
   ./check_devices.sh
   ```

## Script Details

The `check_devices.sh` script performs the following steps:

1. Reads each device name from `host.txt`.
2. Uses `sshpass` to SSH into each device using the provided username and password.
3. Runs the `route_check.py` script on each device.
4. Checks the output of the `route_check.py` script.
5. Reports any device that produces output, indicating a potential issue.

If `route_check.py` runs successfully without producing any output, it is assumed that there are no issues with that device.

### Important Note on SSH `-n` Parameter

The script uses the `-n` parameter with the `ssh` command to prevent reading from STDIN. This is crucial because without the `-n` parameter, the script may only process the first device listed in `host.txt`. The `-n` parameter ensures that the script reads and processes all devices listed in the file correctly.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.
```


