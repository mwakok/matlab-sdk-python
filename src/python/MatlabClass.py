import numpy as np


class MatlabClass:
    def __init__(self, matlab_handle, matlab_object):
        self._h = matlab_handle
        self._matlab_object = matlab_object
        self._initialize_properties()
        self._initialize_methods()

    def _initialize_properties(self):
        properties = self._h.callFunction("struct", self._matlab_object)
        for key, value in properties.items():
            prop_name = key.lower()
            setattr(self, prop_name, value)

    def _initialize_methods(self):
        methods = self._h.call("methods", self._matlab_object)
        for method in methods:
            method_name = method.lower()
            func = lambda self, method_name, *args: self._h.call(
                method_name, self._method_object, *args
            )
            setattr(self, method_name, func)

    def _call_matlab(self):
        return

    def _verify_handle():
        pass

    def __doc__(self):
        """Retrieve the help documentation"""
        self._h.call("doc", self._matlab_object)

    @staticmethod
    def double_to_numpy(double_array):
        """Convert matlab.double to numpy array with same shape

        Parameters
        ----------
        mat : matlab.double
            n-dimensional matlab double array

        Returns
        -------
        numpy.array
        """
        return np.array(double_array._data).reshape(double_array.size[::-1]).T

    def __setattr__(self, __name: str, __value: Any) -> None:
        # Add Matlab parser
        pass
