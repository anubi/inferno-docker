# InfernoMOO Leak of 2015 (Dockerized)

Welcome to the **InfernoMOO** "leak" of 2015! This project preserves an old LambdaMOO spinoff game using **Docker**.
I did this because nobody else has for some reason by now and a part of "game history" isn't being well preserved, so here ya go.

## Getting Started (Windows)

Since my host OS is **Windows**, these instructions focus on running the project on Windows. However, similar steps should work on other operating systems with minor modifications.

### Prerequisites

Ensure you have the following installed:

- [Docker for Windows](https://www.docker.com/products/docker-desktop) with Linux subsystem support (requires **Hypervisor**)
- [Git for Windows](https://gitforwindows.org/) (optional, but useful)
- [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/) for Telnet access

### Installation Steps

1. **Install Docker for Windows** with Linux subsystem support.
2. **Download this project** and extract it to a directory of your choice.
3. **Open a Windows Git Bash or Command Prompt** and navigate to the `inferno-compose` directory:
   ```sh
   cd path/to/inferno-compose
   ```
4. **Start the server using Docker Compose**:
   ```sh
   docker-compose up -d
   ```
5. **Watch the build and launch process** until it completes successfully.
6. **Connect to the server using PuTTY**:
   - Address: `localhost`
   - Port: `7779`
   - Protocol: **Telnet**
7. **Login as an admin (Wizperms)** using the 2015 setup:
   ```
   co Merlin imshana
   ```
8. If you encounter issues, check your **Docker logs** for errors and verify that the server is running:
   ```sh
   docker ps
   docker logs <container_id>
   ```

## Important Notes

### ⚠️ Considerations Before Hosting Publicly

1. **Hosting is functional but not fully secure.**
2. **Database backups are not managed automatically.**
   - You should learn how to **mount an external Docker volume** to store your database persistently.
3. **Email registration for new players is incomplete.**
   - In 2015, I attempted a rewrite to modernize it, but gave up. You will have to research how to hook the email registration functionality into the docker image to host this game on your own.
4. **Security Enhancements Needed.**
   - The base Docker image likely needs **additional security measures**.
5. **Potential Exploits Exist.**
   - Some past security fixes were lost due to poor preservation efforts.
   - There may be known exploits (e.g., sending large 100MB strings to crash the server).

## Enjoy!

This is a preserved piece of MOO history. If you find ways to improve the image or address security issues, consider sharing your improvements with the community!

