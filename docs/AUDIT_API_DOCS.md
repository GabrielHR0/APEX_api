# 📋 Documentação - API de Auditoria

## Visão Geral

A API de Auditoria fornece um histórico completo de todas as alterações feitas nos recursos do sistema através do **paper_trail**. Cada mudança é rastreada com:

- **Quem** modificou (usuário)
- **O quê** foi modificado (campos alterados)
- **Quando** foi modificado (timestamp)
- **Como** foi modificado (antes vs depois)

---

## Permissão Necessária

Para acessar os endpoints de auditoria, o usuário deve ter a permissão:

```
audit:read
```

Esta permissão é atribuída automaticamente ao **admin_role** (todos que têm role "admin" têm acesso total).

---

## Endpoints

### 1. Listar Todas as Auditorias (Global)

**GET** `/api/v1/audits?page=1&per_page=25&action=update&user_id=456&item_type=User&date_from=2024-01-01&date_to=2024-12-31`

Retorna **todas as alterações** do sistema (de todos os modelos) com paginação.

#### Parâmetros Opcionais

| Parâmetro | Tipo | Descrição |
|-----------|------|-----------|
| `action` | string | Tipo de ação: `create`, `update`, `destroy` |
| `user_id` | uuid | ID do usuário que fez a alteração |
| `item_type` | string | Filtrar por tipo de modelo (ex: `User`, `Card`, `SocialMediaProfile`) |
| `date_from` | date | Data inicial (YYYY-MM-DD) |
| `date_to` | date | Data final (YYYY-MM-DD) |
| `page` | integer | Número da página (padrão: 1) |
| `per_page` | integer | Registros por página, máximo 100 (padrão: 25) |

#### Exemplo de Requisição (Listar tudo)

```bash
curl -X GET "http://localhost:3000/api/v1/audits?page=1&per_page=20" \
  -H "Authorization: Bearer SEU_TOKEN_JWT"
```

#### Exemplo de Requisição (Com filtros globais)

```bash
curl -X GET "http://localhost:3000/api/v1/audits?action=destroy&item_type=Card&date_from=2026-02-01&per_page=50" \
  -H "Authorization: Bearer SEU_TOKEN_JWT"
```

---

### 2. Listar Histórico de um Recurso Específico

**GET** `/api/v1/audits?model=User&id=123&page=1&per_page=25&action=update&user_id=456&date_from=2024-01-01&date_to=2024-12-31`

Retorna um histórico paginado de todas as alterações feitas em um recurso específico.

#### Parâmetros Obrigatórios (devem ser fornecidos juntos)

| Parâmetro | Tipo | Descrição |
|-----------|------|-----------|
| `model` | string | Nome da classe do recurso (ex: `User`, `Card`, `ExtensionCore`, `SocialMediaProfile`) |
| `id` | uuid/string | ID do recurso específico |

#### Parâmetros Opcionais (Filtros)

| Parâmetro | Tipo | Descrição |
|-----------|------|-----------|
| `action` | string | Tipo de ação: `create`, `update`, `destroy` |
| `user_id` | uuid | ID do usuário que fez a alteração |
| `date_from` | date | Data inicial (YYYY-MM-DD) |
| `date_to` | date | Data final (YYYY-MM-DD) |
| `page` | integer | Número da página (padrão: 1) |
| `per_page` | integer | Registros por página, máximo 100 (padrão: 25) |

#### Exemplo de Requisição

```bash
curl -X GET "http://localhost:3000/api/v1/audits?model=SocialMediaProfile&id=2bef2a81-cab4-41c4-b27a-6cce8e93f0bb&page=1&per_page=10&action=update" \
  -H "Authorization: Bearer SEU_TOKEN_JWT"
```

#### Exemplo de Resposta (200 OK)

```json
{
  "data": [
    {
      "id": 1,
      "event": "update",
      "created_at": "2026-02-26T14:30:45.123Z",
      "user": {
        "id": "550e8400-e29b-41d4-a716-446655440000",
        "email": "admin@example.com"
      },
      "changes_summary": {
        "url": {
          "before": "https://x.com/olduser",
          "after": "https://x.com/newuser"
        },
        "active": {
          "before": true,
          "after": false
        }
      }
    },
    {
      "id": 2,
      "event": "update",
      "created_at": "2026-02-25T10:15:30.456Z",
      "user": {
        "id": "660e8400-e29b-41d4-a716-446655440001",
        "email": "editor@example.com"
      },
      "changes_summary": {
        "username": {
          "before": "old_username",
          "after": "new_username"
        }
      }
    }
  ],
  "pagination": {
    "page": 1,
    "per_page": 10,
    "total_count": 42,
    "total_pages": 5
  }
}
```

---

### 3. Visualizar Detalhes Completos de uma Alteração

**GET** `/api/v1/audits/:version_id` (sem model/id)

**GET** `/api/v1/audits/:version_id?model=User&id=123` (com model/id, validação de recurso)

Retorna todos os detalhes de uma versão específica, incluindo o JSON completo da alteração.

#### Parâmetros

| Parâmetro | Tipo | Descrição | Obrigatório |
|-----------|------|-----------|-----------|
| `version_id` | integer | ID da versão (obtido da listagem) | Sim |
| `model` | string | Nome da classe do recurso | Não |
| `id` | uuid/string | ID do recurso | Não |

> **Nota:** Se `model` e `id` forem omitidos, busca qualquer versão direto pela `version_id`. Se fornecidos, valida que essa versão pertence ao recurso especificado.

#### Exemplo de Requisição (sem contexto de recurso)

```bash
curl -X GET "http://localhost:3000/api/v1/audits/1" \
  -H "Authorization: Bearer SEU_TOKEN_JWT"
```

#### Exemplo de Requisição (com validação de recurso)

```bash
curl -X GET "http://localhost:3000/api/v1/audits/1?model=Card&id=3bb4f6d4-ff60-4bdd-bfa8-f351f5f14dac" \
  -H "Authorization: Bearer SEU_TOKEN_JWT"
```

#### Exemplo de Resposta (200 OK)

```json
{
  "id": 1,
  "event": "update",
  "created_at": "2026-02-26T14:30:45.123Z",
  "item_id": "3bb4f6d4-ff60-4bdd-bfa8-f351f5f14dac",
  "item_type": "Card",
  "user": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "admin@example.com"
  },
  "object": {
    "id": "3bb4f6d4-ff60-4bdd-bfa8-f351f5f14dac",
    "title": "Novo Título",
    "description": "Nova descrição",
    "position": 1,
    "active": true,
    "carousel_frame_id": "018967d4-f2ef-4fe3-8121-f1115ae6baee",
    "created_at": "2026-02-20T08:00:00.000Z",
    "updated_at": "2026-02-26T14:30:45.123Z"
  },
  "object_changes": {
    "title": ["Título Antigo", "Novo Título"],
    "description": ["Descrição antiga", "Nova descrição"],
    "updated_at": ["2026-02-20T08:00:00.000Z", "2026-02-26T14:30:45.123Z"]
  },
  "changes_detailed": [
    {
      "field": "title",
      "before": "Título Antigo",
      "after": "Novo Título"
    },
    {
      "field": "description",
      "before": "Descrição antiga",
      "after": "Nova descrição"
    },
    {
      "field": "updated_at",
      "before": "2026-02-20T08:00:00.000Z",
      "after": "2026-02-26T14:30:45.123Z"
    }
  ]
}
```

---

## Casos de Uso Comuns

### 1. Ver Histórico Global do Sistema

```javascript
// Listar TODAS as auditorias com paginação
async function getGlobalAuditHistory(page = 1, perPage = 50) {
  const response = await fetch(
    `/api/v1/audits?page=${page}&per_page=${perPage}`,
    {
      headers: { 'Authorization': `Bearer ${token}` }
    }
  );
  return await response.json();
}

// Uso
const globalHistory = await getGlobalAuditHistory(1, 100);
console.log(`Total de alterações no sistema: ${globalHistory.pagination.total_count}`);
globalHistory.data.forEach(audit => {
  console.log(`${audit.item_type}#${audit.item_id}: ${audit.event} por ${audit.user?.email}`);
});
```

---

### 2. Ver Histórico Completo de um Usuário

```javascript
// JavaScript/React exemplo
async function getAuditHistory(userId) {
  const response = await fetch(
    `/api/v1/audits?model=User&id=${userId}&per_page=50`,
    {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    }
  );
  return await response.json();
}

// Uso
const history = await getAuditHistory('550e8400-e29b-41d4-a716-446655440000');
console.log(`Total de alterações: ${history.pagination.total_count}`);
```

---

### 3. Filtrar Alterações de um Usuário Específico em um Período

```javascript
// Buscar todas as mudanças feitas pelo usuário "X" entre duas datas
async function getUserChangesInPeriod(resourceId, userId, dateFrom, dateTo) {
  const params = new URLSearchParams({
    model: 'SocialMediaProfile',
    id: resourceId,
    user_id: userId,
    date_from: dateFrom,
    date_to: dateTo,
    per_page: 100
  });

  const response = await fetch(`/api/v1/audits?${params}`, {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  return await response.json();
}
```

---

### 4. Monitorar Apenas Deletions

```javascript
// Obter todas as deleções de cards em um período (para recuperação)
async function getDeletedRecords(dateFrom, dateTo) {
  const params = new URLSearchParams({
    model: 'Card',
    id: '018967d4-f2ef-4fe3-8121-f1115ae6baee', // card_id
    action: 'destroy',
    date_from: dateFrom,
    date_to: dateTo
  });

  const response = await fetch(`/api/v1/audits?${params}`, {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  return await response.json();
}
```

---

### 5. Filtrar Todas as Deletions do Sistema

```javascript
// Buscar TODAS as deleções de qualquer modelo (auditoria de segurança)
async function getAllDeletions(dateFrom, dateTo) {
  const params = new URLSearchParams({
    action: 'destroy',
    date_from: dateFrom,
    date_to: dateTo,
    per_page: 100
  });

  const response = await fetch(`/api/v1/audits?${params}`, {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  
  const data = await response.json();
  
  // Agrupar por tipo de modelo
  const deletionsByModel = {};
  data.data.forEach(audit => {
    if (!deletionsByModel[audit.item_type]) {
      deletionsByModel[audit.item_type] = [];
    }
    deletionsByModel[audit.item_type].push(audit);
  });
  
  return deletionsByModel;
}
```

---

### 6. Implementar Widget de Timeline no Front-end

```javascript
// Componente React exemplo
import React, { useState, useEffect } from 'react';

function AuditTimeline({ model, id }) {
  const [audits, setAudits] = useState([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);

  useEffect(() => {
    const params = new URLSearchParams({
      model,
      id,
      page,
      per_page: 20
    });

    fetch(`/api/v1/audits?${params}`, {
      headers: { 'Authorization': `Bearer ${token}` }
    })
      .then(res => res.json())
      .then(data => {
        setAudits(data.data);
        setLoading(false);
      });
  }, [page]);

  if (loading) return <div>Carregando histórico...</div>;

  return (
    <div className="timeline">
      {audits.map((audit) => (
        <div key={audit.id} className="timeline-event">
          <div className="event-header">
            <strong>{audit.event.toUpperCase()}</strong>
            <span className="time">
              {new Date(audit.created_at).toLocaleString('pt-BR')}
            </span>
          </div>
          <div className="event-user">
            {audit.user ? `por ${audit.user.email}` : 'Usuário removido'}
          </div>
          <div className="event-changes">
            <ul>
              {Object.entries(audit.changes_summary).map(([field, change]) => (
                <li key={field}>
                  <strong>{field}:</strong> "{change.before}" → "{change.after}"
                </li>
              ))}
            </ul>
          </div>
        </div>
      ))}
    </div>
  );
}

export default AuditTimeline;
```

---

## Códigos de Status HTTP

| Código | Significado |
|--------|------------|
| `200` | Sucesso - dados retornados |
| `400` | Erro de validação (model ou id ausentes) |
| `401` | Não autenticado (token inválido/expirado) |
| `403` | Não autorizado (sem permissão `audit:read`) |
| `404` | Recurso não encontrado |

---

## Modelos Auditáveis

Todos os modelos com `has_paper_trail` são auditáveis:

- ✅ User
- ✅ Card
- ✅ SocialMediaProfile
- ✅ ExtensionCore
- ✅ HeroCard
- ✅ HeroBanner
- ✅ CarouselFrame
- ✅ Event
- ✅ Contact
- ✅ Company
- ✅ Address
- ✅ Member
- ✅ Project
- ✅ Role
- ✅ Permission

---

## Estrutura de Resposta

Quando você lista auditorias **sem modelo específico** (globalmente), cada item inclui:

```json
{
  "id": 1,
  "item_id": "2bef2a81-cab4-41c4-b27a-6cce8e93f0bb",
  "item_type": "SocialMediaProfile",
  "event": "update",
  "created_at": "2026-02-26T14:30:45.123Z",
  "user": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "admin@example.com"
  },
  "changes_summary": { ... }
}
```

- **`item_id`**: ID do recurso que foi modificado
- **`item_type`**: Tipo de modelo (User, Card, SocialMediaProfile, etc.)
- **`event`**: Tipo de mudança (create, update, destroy)
- **`changes_summary`**: Resumo das mudanças feitas

Quando você filtra **por um recurso específico** (com `model` e `id`), o `item_id` e `item_type` são sempre iguais aos parâmetros fornecidos.

---

## Considerações de Segurança

1. **Autorização por usuário**: A API valida que o usuário tem permissão `audit:read`
2. **Isolamento de dados**: Quando `model` e `id` são fornecidos, valida-se que o recurso existe (autorização implícita)
3. **Limite de registros**: O `per_page` é limitado a 100 para evitar sobrecarga
4. **Sem limite de resultados globais**: Se nenhum `model`/`id` for fornecido, a paginação é obrigatória (não retorna tudo de uma vez)

---

## Troubleshooting

### "Unauthorized (403)"
- Verifique se seu usuário tem role "admin" ou se foi atribuída permissão `audit:read`
- Rode `rails db:seed` para garantir que a permissão existe

### "Model not found"
- Verify the class name (case-sensitive): ❌ `user`, ✅ `User`
- Valid models listed at the top of documentation
- If using `model` param without `id` (or vice versa), you'll get error: "Both model and id parameters are required together, or omit both"

### "Record not found (404)"
- Verifique se o ID do recurso realmente existe
- O recurso pode ter sido deletado, mas seu histórico permanece

### Nenhum resultado retornado
- Verifique se há realmente alterações no período consultado
- Use `date_from` e `date_to` mais amplos para testar
- O filtro `action` é case-sensitive: `create`, `update`, `destroy`
- Para listagem global (sem model/id), verifique se há auditorias no seu sistema com `per_page=100&page=1`

---

## Próximos Passos/Melhorias Possíveis

- [ ] Exportar auditoria em CSV/PDF
- [ ] Webhook para alterações em tempo real
- [ ] Dashboard de auditoria com gráficos
- [ ] Alertas automáticos para mudanças sensíveis
- [ ] Reversão automática (undo) de alterações
