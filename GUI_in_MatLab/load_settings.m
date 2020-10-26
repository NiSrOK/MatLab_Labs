function load_settings(handles, varargin)
settings_file_name = 'settings';
if ~isempty(varargin), settings_file_name = varargin{1}; end
if ~exist(settings_file_name,'file'), return; end
if isempty(whos('-file',settings_file_name,'SAVE_DATA')), return; end
load(settings_file_name,'SAVE_DATA');
if ~isa(SAVE_DATA,'cell'), return; end
if size(SAVE_DATA,2) ~=3, return; end

% ('имя_объекта', 'имя_поля' 'значение_поля')
for i=1:size(SAVE_DATA,1)
    if isfield(handles,SAVE_DATA{i,1})
        set(handles.(SAVE_DATA{i,1}),SAVE_DATA{i,2},SAVE_DATA{i,3});
    end
end