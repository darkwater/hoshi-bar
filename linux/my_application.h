#ifndef FLUTTER_MY_APPLICATION_H_
#define FLUTTER_MY_APPLICATION_H_

#include <gtk/gtk.h>
#include <flutter_linux/flutter_linux.h>

G_DECLARE_FINAL_TYPE(MyApplication, my_application, MY, APPLICATION,
                     GtkApplication)

/**
 * my_application_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #MyApplication.
 */
MyApplication* my_application_new();

void apply_input_regions();
void method_call_cb(FlMethodChannel *channel, FlMethodCall *method_call, gpointer user_data);
GtkWidget* find_gl_area(GtkWidget* widget);

#endif  // FLUTTER_MY_APPLICATION_H_
