function save_settings(handles, varargin)
settings_file_name = 'settings';
if ~isempty(varargin), settings_file_name = varargin{1}; end
names = fieldnames(handles);
SAVE_DATA = cell(0,3); % ('имя_объекта', 'имя_поля' 'значение_поля')
for i=1:numel(names)
    hObject = handles.(names{i});
    obj_fields = get(hObject);
    if isfield(obj_fields, 'Style'), type = get(hObject,'Style');
    elseif isfield(obj_fields, 'Type'), type = get(hObject,'Type');
    else continue;
    end
    switch(type)
        case 'edit'
            SAVE_DATA(end+1,:) = {names{i} 'String' get(hObject,'String')};
        case 'radiobutton'
            SAVE_DATA(end+1,:) = {names{i} 'Value' get(hObject,'Value')};
        case 'figure'
            SAVE_DATA(end+1,:) = {names{i} 'Position' get(hObject,'Position')};
    end
end
save(settings_file_name,'SAVE_DATA');