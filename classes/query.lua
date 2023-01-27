--- @class StaxDatabase
StaxDatabase = {}

--- Fires an asynchronous database query
---@param query string
---@param data table<string, any> | nil
---@return StaxDatabaseResults | nil
function StaxDatabase.AsyncQuery(query, data)
  if not query then
    return nil
  end

  if not data then
    data = nil
  end

  local results = exports["stax_database"]:AsyncQuery({
    query = query,
    data = data
  })

  local resultsClass = StaxDatabaseResults.New(results)

  if resultsClass then
    return resultsClass
  end

  return nil
end