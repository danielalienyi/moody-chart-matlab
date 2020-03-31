function varargout = Moody(varargin)
% MOODY M-file for Moody.fig
%      MOODY, by itself, creates a new MOODY or raises the existing
%      singleton*.
%
%      H = MOODY returns the handle to a new MOODY or the handle to
%      the existing singleton*.
%
%      MOODY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOODY.M with the given input arguments.
%
%      MOODY('Property','Value',...) creates a new MOODY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Moody_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Moody_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Moody

% Last Modified by GUIDE v2.5 19-Aug-2013 14:57:57

% Programmed by Daniel Alienyi

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Moody_OpeningFcn, ...
                   'gui_OutputFcn',  @Moody_OutputFcn, ...
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


% --- Executes just before Moody is made visible.
function Moody_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Moody (see VARARGIN)

% Choose default command line output for Moody
handles.output = hObject;
handles.rn = '';
handles.rr = '';


ar = [0.000001,0.000005,0.00001,0.00005,0.0001,0.0002,0.0004,0.0006,0.0008,0.001,0.002,0.004,0.006,0.008,0.01,0.015,0.02,0.03,0.04,0.05];
rn = 4000:500:10^8;
 px = rn(end);
 axes(handles.axes2)
 k = 0;
 ha = handles.axes2;
for rr = ar;
    k = k+1;
    f = (-1.52/log(10)*log((rr/7.21)^1.042+(2.731./rn).^0.9152)).^-2.169;
    py = f(end);
    loglog(rn,f);
    
    text(px,py,[' \leftarrow e/D = ',num2str(rr)],'color','k','fontsize',10,'fontweight','bold')
    hold on
end

rn2 = 600:200:2000;
f2 = 64./rn2;
loglog(rn2,f2), grid on
rn2 = [2.5*10^8,4*10^7,1.75*10^7,8*10^6,4*10^6,2.5*10^6,1.625*10^6,1.25*10^6,6*10^5,2.75*10^5,1.75*10^5,1.25*10^5,10^5,6*10^4,45000,27500,20000,15000,10000*1.1];
ar2 = [0.00001,0.00005,0.0001,0.0002,0.0004,0.0006,0.0008,0.001,0.002,0.004,0.006,0.008,0.01,0.015,0.02,0.03,0.04,0.05,0.06];
f3 = (-1.52/2.3026.*log((ar2./7.21).^1.042+(2.731./rn2).^0.9152)).^-2.169;
hold on
h2 = loglog(rn2,f3,'r','linestyle','--');
xlim([600,10^8]);
 ylim([0.008,0.1]);
 
 xlabel('Reynold''s number, N_{re}= \rho\veeD/\mu','color',[0.9,0,0.5],'fontsize',13,'fontweight','bold')
 ylabel('Friction Factor, f','color',[0.9,0,0.5],'fontsize',13,'fontweight','bold')
 text(10^8,0.09,' Relative Roughness','fontsize',10,'color',[0.9,0,0.5],'fontweight','bold')
 text(1.1*10^4,0.079,'\leftarrow------------------------------------------------Fully-rough zone------------------------------------------------------\rightarrow','fontsize',10,'horizontalalignment','left')
 title('Moody Friction Factor Chart','fontsize',10,'color',[0.9,0,0.5],'fontweight','bold')
 text(4000,0.083,'Transition','fontsize',10)
    text(4000,0.079,'\leftarrow-zone\rightarrow','fontsize',10,'horizontalalignment','left')
text(2000,0.086,'Critical','fontsize',10,'horizontalalignment','left')
text(2000,0.082,'zone','fontsize',10,'horizontalalignment','left')
text(2000,0.079,'\leftarrow---\rightarrow','fontsize',10,'horizontalalignment','left')
text(800,0.084,'Laminar','fontsize',10,'horizontalalignment','left')
text(600,0.079,'\leftarrow---flow--\rightarrow','fontsize',10,'horizontalalignment','left')
text(10^6,0.0118,'Smooth pipes\rightarrow','fontsize',10,'horizontalalignment','right')
    hold off
    hl = findall(ha,'Type','line');
for line = 1:length(hl);
    set(hl(line),'uicontextmenu',handles.axesline)
end




% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Moody wait for user response (see UIRESUME)
% uiwait(handles.figure2);


% --- Outputs from this function are returned to the command line.
function varargout = Moody_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
    

function editrn_Callback(hObject, eventdata, handles)
% hObject    handle to editrn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editrn as text
%        str2double(get(hObject,'String')) returns contents of editrn as a double
try
rn = eval(get(handles.editrn,'string'));
if (get(handles.radff,'value') == 1) && (get(handles.radlm,'value') == 1)&&(rn<100|rn>2000)
errordlg([num2str(rn) ' is not a realistic Nre for laminal flow'],'Bad Input','modal')
uicontrol(hObject)
set(handles.editrn,'string','')
return
elseif  (get(handles.radff,'value') == 1 | get(handles.radrr,'value') == 1) && (get(handles.radtb,'value')==1)&& (rn>= 10^9 |rn<=2000)
errordlg([num2str(rn) ' is not a realistic Nre for turbulent flow'],'Bad Input','modal')
uicontrol(hObject)
set(handles.editrn,'string','') 
return
elseif (get(handles.radrn,'value') == 1) && (get(handles.radtb,'value') == 1) &&  (rn>0.1 | rn<0.0000005)
    errordlg([num2str(rn) ' is not a realistic f for turbulent flow'],'Bad Input','modal')
uicontrol(hObject)
set(handles.editrn,'string','') 
return
elseif ((get(handles.radrn,'value') == 1) && (get(handles.radlm,'value') == 1)) &&  (rn>0.1 | rn<0.031)
errordlg([num2str(rn) ' is not a realistic f for laminar flow'],'Bad Input','modal')
uicontrol(hObject)
set(handles.editrn,'string','') 
return
end
handles.rn = rn;
catch
 errordlg([get(handles.editrn,'string') ' is not a numeric value'], 'Bad Input','modal')
uicontrol(hObject)
set(handles.editrn,'string','') 
return
end


guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function editrn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editrn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editrr_Callback(hObject, eventdata, handles)
% hObject    handle to editrr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editrr as text
%        str2double(get(hObject,'String')) returns contents of editrr as a double
try
rr = eval(get(handles.editrr,'string'));
if (get(handles.radff,'value') == 1 | get(handles.radrn,'value') == 1)&& (rr>0.1 | rr<0.0000005)
errordlg([num2str(rr) ' is not a realistic e/D'],'Bad Input','modal')
uicontrol(hObject)
set(handles.editrr,'string','')
return
elseif (get(handles.radrr,'value') == 1) && (rr>0.2 | rr < 0.007)
  errordlg([num2str(rr) ' is not a realistic f'],'Bad Input','modal')
uicontrol(hObject)
set(handles.editrr,'string','')
return
end
handles.rr = rr;
catch
    
errordlg([get(handles.editrr,'string') ' is not a numeric value'], 'Bad Input','modal')
uicontrol(hObject)
set(handles.editrr,'string','')
return
end

    
    
    
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function editrr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editrr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editff_Callback(hObject, eventdata, handles)
% hObject    handle to editff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editff as text
%        str2double(get(hObject,'String')) returns contents of editff as a double


% --- Executes during object creation, after setting all properties.
function editff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushff.
function pushff_Callback(hObject, eventdata, handles)
% hObject    handle to pushff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
format longE
try 
    
if get(handles.radtb,'value') == 1
if get(handles.radff,'value') == 1
rn = handles.rn;
rr = handles.rr;

f = (-1.52/log(10)*log((rr/7.21)^1.042+(2.731./rn).^0.9152)).^-2.169;
set(handles.editff,'string',num2str(f))
elseif get(handles.radrn,'value') == 1
f = handles.rn;
rr = handles.rr;

rn1 =  (exp(f^(-1/2.169)*(-log(10)/1.52)) - (rr/7.21)^1.042)^(1/0.9152);
rn = 2.731/rn1;
set(handles.editff,'string',num2str(rn))
else
rn = handles.rn;
f = handles.rr;
rr = (exp(f^(-1/2.169)*(-log(10)/1.52))-(2.731./rn).^0.9152)^(1/1.042)*7.21;
set(handles.editff,'string',num2str(rr))
end
else
    if get(handles.radff,'value') == 1
        rn = handles.rn;
        f = 64/rn;
        set(handles.editff,'string',num2str(f))
    else
        f = handles.rn;
        rn = 64/f;
        set(handles.editff,'string',num2str(rn))
    end
end
catch
    set(handles.editff,'string','')
    errordlg('You must enter a valid numeric value','Bad Input','modal')
uicontrol(hObject)
return
end
handles.rn = '';
handles.rr = '';
    
guidata(hObject,handles);

% --- Executes on button press in check1.


% --- Executes on button press in push2.
function push2_Callback(hObject, eventdata, handles)
% hObject    handle to push2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clearthem(handles)
hf = zeros(2,1);
hf = get(0,'children');
hf1 = hf(2);
hf2 = hf(1);
set(hf1,'visible','on')
delete(hf2)


% --------------------------------------------------------------------
function rn_Callback(hObject, eventdata, handles)
% hObject    handle to rn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function axesline_Callback(hObject, eventdata, handles)
% hObject    handle to axesline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.rrv,'visible','on')
cpt = get(gcf,'currentpoint');
cptx = cpt(1);
cpty = cpt(2);
xl = get(handles.axes2,'xlim');
yl = get(handles.axes2,'ylim');
axes(handles.axes2)
x = (cptx - 86.85)/140.2 *(log10(xl(2)) - log10(xl(1))) + log10(xl(1));
x = 10^x;
y = (cpty - 6.1)/42.384615*(log10(yl(2))- log10(yl(1))) + log10(yl(1));
y = 10^y;
set(handles.rnv,'label',num2str(x))
set(handles.ffv,'label',num2str(y))
if x>= 4000
z = (exp(y^(-1/2.169)*(-log(10)/1.52))-(2.731./x).^0.9152)^(1/1.042)*7.21;
set(handles.regime,'label','Turbulent')
if isreal(z)
set(handles.rrv,'label',num2str(z))
else
  set(handles.rrv,'label','Not Real')
end
elseif x<= 2000
set(handles.regime,'label','Laminar')
set(handles.rrv,'visible','off')
else
set(handles.regime,'label','Critical')
z = (exp(y^(-1/2.169)*(-log(10)/1.52))-(2.731./x).^0.9152)^(1/1.042)*7.21;
ck = isreal(z);
if ck == 1
    set(handles.rrv,'label',num2str(z))
else
    set(handles.rrv,'label','Not real')
end
end
    
guidata(hObject,handles);



function clearthem(handles)
set(handles.editrn,'string','')
set(handles.editrr,'string','')
set(handles.editff,'string','')

% --- Executes when selected object is changed in pan1.
function pan1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in pan1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if get(handles.radff,'value') == 1
    set(handles.txtrn,'string','Reynold''s No (Nre)') 
    set(handles.txtrr,'string','Relative Roughness (e/D)')
    set(handles.pushff,'string','Friction Factor (f)')
elseif get(handles.radrn,'value') == 1
    set(handles.pushff,'string','Reynold''s No (Nre)') 
    set(handles.txtrr,'string','Relative Roughness (e/D)')
    set(handles.txtrn,'string','Friction Factor (f)')
else
    set(handles.txtrn,'string','Reynold''s No (Nre)') 
    set(handles.pushff,'string','Relative Roughness (e/D)')
    set(handles.txtrr,'string','Friction Factor (f)')
    
end
clearthem(handles)


% --- Executes on button press in pushclear.
function pushclear_Callback(hObject, eventdata, handles)
% hObject    handle to pushclear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clearthem(handles)


% --- Executes on button press in pushexit.
function pushexit_Callback(hObject, eventdata, handles)
% hObject    handle to pushexit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close


% --------------------------------------------------------------------
function rnv_Callback(hObject, eventdata, handles)
% hObject    handle to rnv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function rr_Callback(hObject, eventdata, handles)
% hObject    handle to rr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function rrv_Callback(hObject, eventdata, handles)
% hObject    handle to rrv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ff_Callback(hObject, eventdata, handles)
% hObject    handle to ff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in pan2.
function pan2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in pan2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if get(handles.radlm,'value') == 1
    set(handles.radrr,'enable','off')
    set(handles.editrr,'enable','off')
    set(handles.txtrr,'enable','off')
    set(handles.editrr,'string','Not Required')
    set(handles.radff,'value',1)
    pan1_SelectionChangeFcn(hObject, eventdata, handles)
else
    set(handles.radrr,'enable','on')
    set(handles.editrr,'enable','on')
    set(handles.txtrr,'enable','on')
    set(handles.editrr,'string','')
end
clearthem(handles)
guidata(hObject,handles)


% --------------------------------------------------------------------
function regime_Callback(hObject, eventdata, handles)
% hObject    handle to regime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure2.
function figure2_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --------------------------------------------------------------------
function back2_Callback(hObject, eventdata, handles)
% hObject    handle to back2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
push2_Callback(hObject, eventdata, handles)
