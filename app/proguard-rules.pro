# Add project specific ProGuard rules here.
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# Keep Room entities
-keep class com.akay.core.data.db.entity.** { *; }

# Keep Hilt generated code
-dontwarn dagger.hilt.**

# Keep OkHttp
-dontwarn okhttp3.**
-dontwarn okio.**

# Keep WebView JS interface
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# YoutubeDL.init() opens its bundled archives with Apache Commons Compress.
# ExtraFieldUtils.register() instantiates every ZipExtraField implementation
# through Class.newInstance(). R8 removes those public no-arg constructors, so
# the static initializer throws "is not a concrete class" and the release
# process dies in AxBrowserApp.onCreate. Debug builds never minify, so they
# do not hit this.
-keep class org.apache.commons.compress.archivers.zip.** {
    public <init>();
    public <fields>;
    public <methods>;
}
-keep class org.apache.commons.compress.compressors.** { *; }
-dontwarn org.apache.commons.compress.**

# Python and the yt-dlp/ffmpeg JNI layer look these classes up by name.
-keep class com.yausername.youtubedl_android.** { *; }
-keep class com.yausername.youtubedl_common.** { *; }
-keep class com.yausername.ffmpeg.** { *; }
-dontwarn com.yausername.**

# YoutubeDL parses JSON with Jackson reflection (ObjectMapper + annotations).
-keep class com.fasterxml.jackson.annotation.** { *; }
-keep class com.fasterxml.jackson.core.** { *; }
-keep class com.fasterxml.jackson.databind.** { *; }
-dontwarn com.fasterxml.jackson.**

# Keep Serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
