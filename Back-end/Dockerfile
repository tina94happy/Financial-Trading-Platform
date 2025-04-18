# --- STAGE 1: build 用 Maven ---
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app

# 複製 pom.xml 和自帶的 lib jar（local dependencies）
COPY pom.xml .
COPY src/main/webapp/WEB-INF/lib /libs/

# 安裝這三個 jar 到 Maven 本地倉庫
RUN mvn install:install-file -Dfile=/libs/jntoo-query.jar -DgroupId=jntoo-query -DartifactId=jntoo-query -Dversion=1.0 -Dpackaging=jar && \
    mvn install:install-file -Dfile=/libs/ueditor-mini.jar -DgroupId=ueditor-mini -DartifactId=ueditor-mini -Dversion=1.0 -Dpackaging=jar && \
    mvn install:install-file -Dfile=/libs/jxl.jar -DgroupId=jxl -DartifactId=jxl -Dversion=1.0 -Dpackaging=jar

# 預下載依賴（加快下步 build）
RUN mvn dependency:go-offline

# 複製 src 並建置
COPY src ./src
RUN mvn clean package -DskipTests


# --- STAGE 2: 執行用 JDK（無 Maven） ---
FROM openjdk:8-jdk-alpine
WORKDIR /app

# 複製 jar 從第一階段
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8088
ENTRYPOINT ["java", "-jar", "app.jar"]
