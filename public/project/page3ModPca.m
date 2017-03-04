function varargout = page3ModPca(varargin)
% PAGE3MODPCA MATLAB code for page3ModPca.fig
%      PAGE3MODPCA, by itself, creates a new PAGE3MODPCA or raises the existing
%      singleton*.
%
%      H = PAGE3MODPCA returns the handle to a new PAGE3MODPCA or the handle to
%      the existing singleton*.
%
%      PAGE3MODPCA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE3MODPCA.M with the given input arguments.
%
%      PAGE3MODPCA('Property','Value',...) creates a new PAGE3MODPCA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before page3ModPca_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to page3ModPca_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help page3ModPca

% Last Modified by GUIDE v2.5 15-Mar-2015 22:05:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page3ModPca_OpeningFcn, ...
                   'gui_OutputFcn',  @page3ModPca_OutputFcn, ...
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


% --- Executes just before page3ModPca is made visible.
function page3ModPca_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to page3ModPca (see VARARGIN)

% Choose default command line output for page3ModPca
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes page3ModPca wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = page3ModPca_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname]=uigetfile('*.*','Select An Image');
s=strcat(pathname,filename);
sinput=strcat('db\',filename);
set(handles.text1,'String',s);
mat=imread(s);
x=pca_gui(mat);
output =strcat( 'db\s',int2str(x),' (1).pgm');
set(handles.text3,'String',output);
axes(handles.axes1);
imshow(sinput);
axes(handles.axes2);
imshow(output);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
close all force;
page2
