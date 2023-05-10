function plan = buildfile
    plan = buildplan(localfunctions);
    plan.DefaultTasks = "compile";
    plan("compile").Dependencies = ["check" "test"];
end


function checkTask(~)
% Identify code issues
issues = codeIssues;
assert(isempty(issues.Issues),formattedDisplayText( ...
    issues.Issues(:,["Location" "Severity" "Description"])))
end


function testTask(~)
% Run unit tests
results = runtests(IncludeSubfolders=true,OutputDetail="terse");
assertSuccess(results);
end


function compileTask(~)
% Compile Python package
appFiles = {'call.m', 'loadVar.m', 'saveVar.m'};
f = fullfile('src', 'matlab', appFiles);
opts = compiler.build.PythonPackageOptions(f,...
    'OutputDir','PythonWrapper',...
    'AutoDetectDataFiles','off',...
    'Verbose','on');
compiler.build.pythonPackage(opts);
end

