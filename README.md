# Wrapper for Matlab code compiled to a Python package

**⚠️ This software is under active development and currently in a pre-alpha state.**

## Purpose
Create a Python wrapper for Matlab compiled code in order to 
- Call Matlab functions from Python
- Call class methods and properties
- Convert datatypes
- Handle Matlab figures
- Handle GUI


## Running the compiler

### Local
Compiling was done with Matlab R2023a using the Compiler SDK. 


```bash
docker build . -t matlab:r2023a
```

```bash
docker run -it --rm --mac-address 02:42:ac:11:ff:ff -v /$(pwd):/opt/src/ matlab:r2023a matlab -batch "buildtool"
```



### GitHub Action  
The available Matlab environment on GitHub Actions does not have the Matlab Compiler installed, see [documentation](https://github.com/matlab-actions#run-matlab-command:~:text=Currently%2C%20this%20action%20is%20available%20only%20for%20public%20projects.%20It%20does%20not%20set%20up%20transformation%20products%2C%20such%20as%20MATLAB%20Coder%E2%84%A2%20and%20MATLAB%20Compiler%E2%84%A2). In order to be able to compile the Matlab source code as a Python package with GitHub Actions, we will need to use a self-hosted runner with a custom Matlab docker container. 

