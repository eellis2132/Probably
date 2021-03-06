-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.command.register_handler({'version', 'ver', 'v'}, function()
  ProbablyEngine.command.print('You are running build ' .. ProbablyEngine.version)
end)

ProbablyEngine.command.register_handler({'help', '?', 'wat'}, function()
  ProbablyEngine.command.print('|cff0000ffProbablyEngine build |cffffffff' .. ProbablyEngine.version)
  ProbablyEngine.command.print('|cff0000ff/pe |cffffffffcycle |cff0000ff-- |cff00ccffmanually run the addon')
  ProbablyEngine.command.print('|cff0000ff/pe |cfffffffftoggle |cff0000ff-- |cff00ccffenable/disable the addon')
  ProbablyEngine.command.print('|cff0000ff/pe |cffffffffcd |cff0000ff-- |cff00ccfftoggle cooldowns')
  ProbablyEngine.command.print('|cff0000ff/pe |cffffffffkick |cff0000ff-- |cff00ccfftoggle interrupts')
  ProbablyEngine.command.print('|cff0000ff/pe |cffffffffaoe |cff0000ff-- |cff00ccfftoggle multi target rotation')
  ProbablyEngine.command.print('|cff0000ff/pe |cffffffffct |cff0000ff-- |cff00ccfftoggle the combat tracker ui')
  ProbablyEngine.command.print('|cff0000ff/pe |cffffffffal |cff0000ff-- |cff00ccfftoggle the action log ui')
  ProbablyEngine.command.print('|cff0000ff/pe |cfffffffflag |cff0000ff-- |cff00ccffput a box on screen that shows rotation lag in ms')
  ProbablyEngine.command.print('|cff0000ff/pe |cffffffffturbo |cff0000ff-- |cff00ccffenable turbo mode')
end)

ProbablyEngine.command.register_handler({'cycle', 'pew', 'run'}, function()
  ProbablyEngine.cycle(true)
end)

ProbablyEngine.command.register_handler({'toggle', 'enable', 'disable'}, function()
  ProbablyEngine.buttons.toggle('MasterToggle')
end)

ProbablyEngine.command.register_handler({'cd', 'cooldown', 'cooldowns'}, function()
  ProbablyEngine.buttons.toggle('cooldowns')
end)

ProbablyEngine.command.register_handler({'kick', 'interrupts', 'interrupt', 'silence'}, function()
  ProbablyEngine.buttons.toggle('interrupt')
end)

ProbablyEngine.command.register_handler({'aoe', 'multitarget'}, function()
  ProbablyEngine.buttons.toggle('multitarget')
end)

ProbablyEngine.command.register_handler({'ct', 'combattracker', 'ut', 'unittracker', 'tracker'}, function()
  UnitTracker.toggle()
end)

ProbablyEngine.command.register_handler({'al', 'log', 'actionlog'}, function()
  PE_ActionLog:Show()
end)

ProbablyEngine.command.register_handler({'lag', 'cycletime'}, function()
  PE_CycleLag:Show()
end)

ProbablyEngine.command.register_handler({'turbo', 'godmode'}, function()
  ProbablyEngine.config.toggle('pe_turbo')
  local state = ProbablyEngine.config.data['pe_turbo']
  if state then
    ProbablyEngine.print('Turbo Mode Enabled!')
    SetCVar('maxSpellStartRecoveryOffset', 1)
    SetCVar('reducedLagTolerance', 10)
    ProbablyEngine.cycleTime = 10
  else
    ProbablyEngine.print('Turbo Mode Disabled.')
    SetCVar('maxSpellStartRecoveryOffset', 1)
    SetCVar('reducedLagTolerance', 100)
    ProbablyEngine.cycleTime = 100
  end
end)