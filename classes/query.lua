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

---@class StaxDatabaseResults
---@field Ok boolean If the query was successful
---@field Results table The results from the query
StaxDatabaseResults = {}
StaxDatabaseResults.__index = StaxDatabaseResults

--- Creates a new instance of StaxDatabaseResults
---@param queryResults table
---@return StaxDatabaseResults | nil
function StaxDatabaseResults.New(queryResults)
  local databaseResults = {}
  setmetatable(databaseResults, StaxDatabaseResults)

  if not queryResults then
    return nil
  end

  if not queryResults.ok then
    return nil
  end

  if not queryResults.results then
    return nil
  end

  databaseResults.Ok = queryResults.ok
  databaseResults.Results = queryResults.results

  return databaseResults
end