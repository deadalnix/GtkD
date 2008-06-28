#!/bin/sh
./compd \
	demos/gtkD/TEditableCells.d \
	demos/gtkD/TestAspectFrame.d \
	demos/gtkD/TestDrawingArea.d \
	demos/gtkD/TestEntries.d \
	demos/gtkD/TestIdle.d \
	demos/gtkD/TestImage.d \
	demos/gtkD/TestScales.d \
	demos/gtkD/TestStock.d \
	demos/gtkD/TestText.d \
	demos/gtkD/TestThemes.d \
	demos/gtkD/TestTreeView1.d \
	demos/gtkD/TestTreeView.d \
	demos/gtkD/TestWindow.d \
	demos/gtkD/TTextView.d \
	-o GtkDTests \
	-c \
	-I src \
	-I demos \
	-c \
	-L .. \
	-l phobos \
	-L . -l gtkd \
	-l dl