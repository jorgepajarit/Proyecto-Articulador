## Carpeta `/src`

La carpeta `/src` es un directorio estándar utilizado para almacenar el código fuente del proyecto. En el contexto de Java, este directorio es esencial y reconocido por herramientas como Eclipse como el lugar predeterminado para los archivos de código fuente, incluyendo clases y otros recursos fundamentales para el desarrollo de software.

## Estructura del Proyecto Web

### `src/main/java`
- Contiene el código fuente Java del proyecto.
- Aquí se encuentran Servlets (controladores Java para manejar peticiones HTTP) y EJBs (Enterprise JavaBeans, controladores de negocio).
- Esta carpeta organiza la lógica de negocio y el control de la aplicación.

### `src/main/webapp`
- Raíz para los recursos web de la aplicación.
  - **`/META-INF`**: Contiene metadatos del archivo WAR.
    - `MANIFEST.MF`: Proporciona metadatos sobre el archivo WAR (Web ARchive) generado.
  - **`/WEB-INF`**:
    - **`web.xml`**: Configuración de la aplicación web.
  - **`/js`**: Archivos JavaScript utilizados en la aplicación.
  - **`/styles`**: Hojas de estilo CSS para dar estilo a las páginas.
  - **`/assets`**: Recursos estáticos como imágenes, iconos, etc.
  - Archivos JSP para páginas web dinámicas.

Esta estructura no solo organiza eficientemente los diferentes componentes del proyecto, sino que también facilita el mantenimiento y la colaboración en equipos de desarrollo, asegurando que la aplicación web sea robusta y escalable.





