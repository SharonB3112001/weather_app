import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.tuempresa.clima.dev"
            resValue(type = "string", name = "app_name", value = "Clima DEV")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.tuempresa.clima"
            resValue(type = "string", name = "app_name", value = "Clima")
        }
    }
}