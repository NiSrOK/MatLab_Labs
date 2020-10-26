function start_parallel
poolobj = gcp('nocreate');
if isempty(poolobj)
    parpool(4);
end