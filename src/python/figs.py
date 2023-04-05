import os

def save_figures(handle, pathname: str) -> None:
    """Save open Matlab figures as png
    
    Parameters
    ----------
    handle : matlab.DeployablePackage
        initialized matlab python package handle
    pathname : str
        output path
    
    Returns
    -------
    None

    """
    open_figs = handle.callFunction("findobj", "Type", "figure")
    for fig in range(open_figs.size[0]):
        # Get the current figure handle
        h = handle.callFunction("gcf")

        # Save figure
        savepath = os.path.join(pathname, f"fig_{fig}.png")
        handle.callFunction("saveas", h, savepath, nargout=0)
        
        # Close current open figure
        handle.callFunction("close", h, nargout=0)


def close_figures(handle) -> None:
    """Close open matlab figures

    Parameters
    ----------
    handle : matlab.DeployablePackage
        initialized matlab python package handle

    Returns
    -------
    None
    """
    open_figs = handle.callFunction("findobj", "Type", "figure")
    for _ in range(open_figs.size[0]):
        h = handle.callFunction("gcf")
        handle.callFunction("close", h, nargout=0)