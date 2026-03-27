---
# Ejemplos de Apex

Apex es un lenguaje de programación fuertemente tipado, orientado a objetos, diseñado específicamente para desarrollar en la plataforma Salesforce. Aquí encontrarás algunos ejemplos clave para comenzar.

## Ejemplo 1: Clase Simple
```apex
public class HelloWorld {
    public String greet() {
        return '¡Hola, Mundo!';
    }
}
```

## Ejemplo 2: Activador Básico
```apex
trigger AccountTrigger on Account (before insert) {
    for (Account acc : Trigger.new) {
        acc.Name = acc.Name + ' - Procesado';
    }
}
```

## Ejemplo 3: Consulta SOQL
```apex
public List<Contact> getContactsByAccountId(Id accountId) {
    return [SELECT Id, Name, Email FROM Contact WHERE AccountId = :accountId];
}
```

## Recursos Adicionales
- [Documentación oficial de Apex](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/)
---
