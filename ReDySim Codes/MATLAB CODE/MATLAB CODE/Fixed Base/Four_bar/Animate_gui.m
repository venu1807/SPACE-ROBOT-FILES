function varargout = Animate_gui(varargin)
% ANIMATE_GUI MATLAB code for Animate_gui.fig
%      ANIMATE_GUI, by itself, creates a new ANIMATE_GUI or raises the existing
%      singleton*.
%
%      H = ANIMATE_GUI returns the handle to a new ANIMATE_GUI or the handle to
%      the existing singleton*.
%
%      ANIMATE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANIMATE_GUI.M with the given input arguments.
%
%      ANIMATE_GUI('Property','Value',...) creates a new ANIMATE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Animate_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Animate_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Animate_gui

% Last Modified by GUIDE v2.5 13-Aug-2017 21:07:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Animate_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Animate_gui_OutputFcn, ...
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


% --- Executes just before Animate_gui is made visible.
function Animate_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Animate_gui (see VARARGIN)

Ti=0; Tf=10;

%Initial Solution

yy0=[pi/2;pi/2;108.4349*pi/180;0;0;0;0;0]

[T,Y] = ode45(@rigid,[Ti Tf],yy0);

set(0,'DefaultLineLineWidth',1.5)
% 
% fh1=figure('Name','Motion Parameters','NumberTitle','off');
% set(fh1, 'color', 'white'); % sets the color to white 
% 
% subplot(2,1,1)
% plot(T,Y(:,1),'.-',T,Y(:,2),'-',T,Y(:,3),'-')
% legend('th1', 'th2','th3')
% xlabel('Time')
% ylabel('Joint Angles')
% 
% %figure(2)
% %subplot(2,2,2)
% %plot(T,Y(:,4),'-',T,Y(:,5))
% %legend('lmdx', 'lmdy')
% %xlabel('Time')
% %ylabel('Langrange Multiplier')
% 
% %figure(3)
% subplot(2,1,2)
% plot(T,Y(:,6),'-',T,Y(:,7),T,Y(:,8))
% legend('dth1','dth2','dth3')
% xlabel('Time')
% ylabel('joint rate')
% 
% %figure(4)
% %subplot(2,2,4)
% %plot(T,Y(:,9),'-',T,Y(:,10),'-')
% %legend('dlmdx','dlmdy')
% %xlabel('Time')
% %ylabel('rate of change of lmd')
% 
% %Animation

% Link lengths
l1=1%0.05; %crank
l2=2%0.13; %output link 
l3=sqrt(10)%0.1; %connecting link
l0=3%0.15;%fixed base

m0=500;m1=1.5;m2=5;m3=3;         %l0=1;l1=1;l2=1;l3=1; 
lc0=.5*l0;lc1=.5*l1;lc2=.5*l2; lc3=.5*l3; 
Izz0=83.61;
Izz1=(1/12)*m1*l1*l1; %1.05; 
Izz2=(1/12)*m2*l2*l2; %1.05;   
Izz3=(1/12)*m3*l3*l3; %1.05;

for i=1:length(T)
    t=T(i);
x00=0; y00=0;
x01=l0; y01=0;
x02=x01+l2*cos(Y(i,2)); y02=y01+l2*sin(Y(i,2));
x03=x02+l3*cos(Y(i,2)+Y(i,3)); y03=y02+l3*sin(Y(i,2)+Y(i,3));
x04=l1*cos(Y(i,1)); y04=l1*sin(Y(i,1));

XX=[x00 x01 x02 x03 x04 x00];
YY=[y00 y01 y02 y03 y04 y00];

%figure(5);
%fill([x02 x03 x04 x05 x06 x07],[y02 y03 y04 y05 y06 y07],'r')
handles.currentdata=plot(XX,YY,'linewidth',4);

xmin=-1*(l0+l1+l2+l3); xmax=1*(l0+l1+l2+l3); ymin=-1*(l0+l1+l2+l3); ymax=1*(l0+l1+l2+l3);
axis([xmin xmax ymin ymax])
grid on
pause(0.00000000000000000005)
end

% Choose default command line output for Animate_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Animate_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Animate_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot
