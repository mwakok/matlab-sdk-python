from typing import Any

import matlab
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
            setattr(self.__class__, method_name, func)
    
    def __setattr__(self, __name: str, __value: Any) -> None:
        self.__dict__[__name] = __value
        self._h.callMethod("setProperty", self._matlab_object, self.to_double(__value))

    @staticmethod
    def double_to_numpy(mat_array: matlab.double) -> np.ndarray:
        """Convert a matlab.double array to a numpy.array with same shape
        """
        return np.array(mat_array._data).reshape(mat_array.size[::-1]).T

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
    @staticmethod
    def double_to_list(value: Any) -> Any:
        """ Convert matlab.double to float or list[int, float]
        """
        if isinstance(value, matlab.double):
            x = np.array(value._data).tolist()
            if len(x) == 1:
                return float(x[0])
            else:
                return x
        else:
            return value
    
    @staticmethod
    def to_double(value: Any) -> Any:
        """ Convert (int, float) and list[int, float] elements to matlab.double
        """
        if isinstance(value, list):
            if all(type(n) in (int, float) for n in value):
                return matlab.double([value])
        elif type(value) in (int, float):
           return matlab.double([value])
        else:
            return value
