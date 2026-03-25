# API de Salesforce

## Introducción a las APIs de Salesforce

Salesforce proporciona múltiples APIs para interactuar con la plataforma de manera programática.

![API de Salesforce](../images/ApiSF.png)

## Tipos de APIs

### REST API
La API REST de Salesforce permite acceder a objetos y datos de Salesforce mediante solicitudes HTTP estándar.

**Características:**
- Basada en estándares REST
- Formato JSON y XML
- Autenticación OAuth 2.0
- Operaciones CRUD completas

**Ejemplo de uso:**
```http
GET /services/data/v58.0/sobjects/Account/001xx000003DGb2AAG
Authorization: Bearer {access_token}
```

### SOAP API
API basada en SOAP para integraciones empresariales robustas.

**Características:**
- Protocolo SOAP/WSDL
- Fuertemente tipada
- Ideal para integraciones empresariales
- Soporte para transacciones complejas

### Bulk API
Diseñada para procesar grandes volúmenes de datos de manera asíncrona.

**Casos de uso:**
- Carga masiva de datos
- Actualizaciones en lote
- Eliminaciones masivas
- Exportación de grandes conjuntos de datos

### Streaming API
Permite recibir notificaciones en tiempo real sobre cambios en los datos.

**Características:**
- Notificaciones push
- Basada en CometD
- Eventos en tiempo real
- Ideal para sincronización de datos

## Autenticación

Salesforce utiliza OAuth 2.0 para la autenticación de APIs:

1. **Username-Password Flow**: Para aplicaciones de confianza
2. **Web Server Flow**: Para aplicaciones web
3. **User-Agent Flow**: Para aplicaciones móviles
4. **JWT Bearer Flow**: Para integraciones servidor-a-servidor

## Límites de API

Salesforce impone límites en las llamadas a la API:

| Tipo de Licencia | Llamadas por 24h |
|------------------|------------------|
| Salesforce Platform | 15,000 |
| Enterprise Edition | 100,000 |
| Unlimited Edition | 200,000 |

!!! warning "Importante"
    Es crucial monitorear el uso de la API para evitar alcanzar los límites y afectar las operaciones.

## Mejores Prácticas

1. **Usar Bulk API para operaciones masivas**: No uses REST API para procesar miles de registros
2. **Implementar manejo de errores**: Gestiona adecuadamente los códigos de error HTTP
3. **Cachear cuando sea posible**: Reduce llamadas innecesarias a la API
4. **Usar campos compuestos**: Minimiza el número de llamadas necesarias
5. **Monitorear límites**: Implementa alertas para el uso de API

## Recursos Adicionales

- [Documentación oficial de Salesforce APIs](https://developer.salesforce.com/docs/apis)
- [Trailhead - API Basics](https://trailhead.salesforce.com/)
- [Postman Collections para Salesforce](https://www.postman.com/salesforce-developers)

---

!!! tip "Consejo"
    Utiliza el Salesforce Workbench para probar y depurar llamadas a la API de manera interactiva.
