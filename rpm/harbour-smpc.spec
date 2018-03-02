# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.27
# 

Name:       harbour-smpc

# >> macros
# << macros

%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{?qtc_builddir:%define _builddir %qtc_builddir}
Summary:    SailfishOS Port of qmobilempd client
Version:    1.3.3
Release:    1
Group:      Qt/Qt
License:    GPLv3
URL:        https://github.com/djselbeck/smpc
Source0:    %{name}-%{version}.tar.bz2
Source100:  harbour-smpc.yaml
Requires:   qt5-qtdeclarative-import-xmllistmodel
Requires:   sailfishsilica-qt5
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  pkgconfig(sailfishapp) >= 0.0.10
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Core)

%description
This is a port the symbian based mpd-client qmobilempd to SailfishOS


%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qtc_qmake5 

%qtc_make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake5_install

# >> install post
# << install post

%files
%defattr(-,root,root,-)
%{_bindir}
%{_datadir}/harbour-smpc
%{_datadir}/applications
%{_datadir}/icons/hicolor/86x86/apps
%{_datadir}/icons/hicolor/108x108/apps
%{_datadir}/icons/hicolor/128x128/apps
%{_datadir}/icons/hicolor/256x256/apps
# >> files
# << files
