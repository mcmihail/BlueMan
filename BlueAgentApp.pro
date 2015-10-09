QT       += core dbus
QT       -= gui

TARGET = BlueAgent
CONFIG   += console
CONFIG   -= app_bundle

DBUS_ADAPTORS += generated/Agent1.xml

TEMPLATE = app

SOURCES += main.cpp \
    dbus/Agent1.cpp \
    dbus/AgentManager1.cpp \
    src/BlueAgent.cpp \
    src/settings/Settings.cpp \
    src/plugin/Plugin.cpp

HEADERS += \
    dbus/Agent1.h \
    dbus/AgentManager1.h \
    inc/BlueAgent.h \
    inc/settings/Settings.h \
    inc/plugin/Plugin.h

INCLUDEPATH += inc/ \
    public/

LIBS += -ldl

init_generated.commands = rm -rf generated; mkdir generated

generate_xml.commands += qdbuscpp2xml -o generated/Agent1.xml dbus/Agent1.h
generate_xml.depends = init_generated

#generate_adaptor.commands = qdbusxml2cpp -a generated/Agent1Adaptor generated/Agent1.xml
#generate_adaptor.depends = generate_xml

QMAKE_EXTRA_TARGETS += generate_xml init_generated
PRE_TARGETDEPS += generate_xml