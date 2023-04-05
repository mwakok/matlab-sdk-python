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
        methods = self._h.callFunction("methods", self._matlab_object)
        for method in methods:
            method_name = method.lower()
            # print(method_name)
            func = lambda self, method_name, *args: self._h.callMethod(
                self._method_object, method_name, *args
            )
            setattr(self, method_name, func)

