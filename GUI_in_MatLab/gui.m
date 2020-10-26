function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 13-Oct-2020 12:16:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
names = {'Plus' 'Minus' 'Multiply' 'Divide'};
for i=1:numel(names)
    BMP = imread(sprintf('bmp\\%s.bmp',names{i}));
    set(handles.(sprintf('pushbutton_%s',names{i})),'CData',BMP);
end
load_settings(handles,'gui_settings.mat');

function calculate(handles, hObject)
FirstNumber = str2num(get(handles.edit_FirstNumber,'String'));
SecondNumber = str2num(get(handles.edit_SecondNumber,'String'));
switch get (hObject,'tag')
    case {'pushbutton_Plus' 'radiobutton_Plus'}, Result = FirstNumber+SecondNumber;
    case {'pushbutton_Minus' 'radiobutton_Minus'}, Result = FirstNumber-SecondNumber;
    case {'pushbutton_Multiply' 'radiobutton_Multiply'}, Result = FirstNumber*SecondNumber;
    case {'pushbutton_Divide' 'radiobutton_Divide'}, Result = FirstNumber/SecondNumber;
end
set(handles.edit_Result,'String',num2str(Result));
plot(handles.axes, [0 real(FirstNumber)], [0 imag(FirstNumber)],'b-o');
hold on;
plot(handles.axes, [0 real(SecondNumber)], [0 imag(SecondNumber)],'r-o');
set(plot(handles.axes, [0 real(Result)], [0 imag(Result)],'k-o'),'LineWidth',2);
hold off;
grid(handles.axes,'on');

function edit_FirstNumber_Callback(hObject, eventdata, handles)
% hObject    handle to edit_FirstNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_FirstNumber as text
%        str2double(get(hObject,'String')) returns contents of edit_FirstNumber as a double


% --- Executes during object creation, after setting all properties.
function edit_FirstNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_FirstNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_SecondNumber_Callback(hObject, eventdata, handles)
% hObject    handle to edit_SecondNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_SecondNumber as text
%        str2double(get(hObject,'String')) returns contents of edit_SecondNumber as a double


% --- Executes during object creation, after setting all properties.
function edit_SecondNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_SecondNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_Result_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Result as text
%        str2double(get(hObject,'String')) returns contents of edit_Result as a double


% --- Executes during object creation, after setting all properties.
function edit_Result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton_Plus.
function pushbutton_Plus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(hObject,'Style')
    case 'pushbutton'
        tag_name = get(hObject,'tag')
        set(handles.(['radiobutton' tag_name(11:end)]), 'Value',1);
end
calculate(handles, hObject)


% --- Executes on button press in pushbutton_Minus.
function pushbutton_Minus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_Plus.
function pushbutton_Multiply_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_Minus.
function pushbutton_Divide_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_settings(handles,'gui_settings.mat');
% Hint: delete(hObject) closes the figure
delete(hObject);
