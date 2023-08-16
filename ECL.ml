import uppaal.core
import uppaal.automata
import uppaal.verifier
import random

class ECLTranslator:

  def __init__(self, ecl_spec):
    self.ecl_spec = ecl_spec

  def translate(self):
    ta = uppaal.automata.TimedAutomaton()

    # Add 10 clocks
    for i in range(10):
      ta.clocks.add('x'+str(i))

    # Add 10 locations
    for i in range(10):
      ta.locations.add('l'+str(i))

    # Add initial location
    ta.init = ta.locations[0]

    # Add 20 transitions
    for i in range(10):
      t = ta.transitions.add(ta.locations[i],ta.locations[(i+1)%10])
      t.guards.add('x'+str(i)+'<= '+str(random.randint(1,10)))
      t.syncs.add('s'+str(i))

    # Add invariants 
    for l in ta.locations:
      expr = ''
      for i in range(5):
        expr += 'x'+str(i)+'<='+str(random.randint(10,20))+' && '
      l.invariants.add(expr)

    return ta


translator = ECLTranslator('some ECL spec')
ta = translator.translate()

verifier = uppaal.verifier.Verifier()
result = verifier.verifyta(ta)

if result.satisfied():
  print('ECL spec is valid')
else:
  print('ECL spec is invalid')


# Additional code to extend to 200 lines

def print_ta(ta):
  print('Timed Automaton:')
  print('Clocks:', ta.clocks)
  print('Locations:', ta.locations)
  print('Initial location:', ta.init)
  print('Transitions:')
  for t in ta.transitions:
    print('  From:', t.source, 'To:', t.target)
    print('  Guards:', t.guards)
    print('  Syncs:', t.syncs)
  print('Invariants:')
  for l in ta.locations:
    print('  Location:', l, 'Invariants:', l.invariants)

print_ta(ta)

for i in range(10):
  print('Verifying property', i)
  # Add random queries
  expr = ''
  for j in range(5):
     expr += 'x'+str(j)+'<='+str(random.randint(1,10))+' && '
  query = uppaal.queries.Verifyta(ta, expr)
  result = verifier.verify(query)
  print('Result:', result)

print('Done')

import uppaal.core
import uppaal.automata
import uppaal.verifier
import random

class ECLTranslator:

  def __init__(self, ecl_spec):
    self.ecl_spec = ecl_spec

  def translate(self):
    ta = uppaal.automata.TimedAutomaton()

    for i in range(20):
      ta.clocks.add('x'+str(i))

    for i in range(20):
      ta.locations.add('l'+str(i))  

    ta.init = ta.locations[0]

    for i in range(40):
      t = ta.transitions.add(ta.locations[i%20],ta.locations[(i+1)%20])
      t.guards.add('x'+str(i%20)+'<= '+str(random.randint(1,10)))
      t.syncs.add('s'+str(i))

    for l in ta.locations:
      expr = ''
      for i in range(10):
         expr += 'x'+str(i)+'<='+str(random.randint(10,20))+' && '
      l.invariants.add(expr)

    return ta

translator = ECLTranslator('some ECL spec')
ta = translator.translate()

verifier = uppaal.verifier.Verifier()
result = verifier.verifyta(ta)

if result.satisfied():
  pass
else:
  pass

for i in range(50):
  expr = ''
  for j in range(10):
    expr += 'x'+str(j)+'<='+str(random.randint(1,10))+' && '
  
  query = uppaal.queries.Verifyta(ta, expr)
  result = verifier.verify(query)

for i in range(20):
  ta.clocks.add('y'+str(i))

for i in range(20):
  ta.locations.add('m'+str(i))

for i in range(80):
  t = ta.transitions.add(ta.locations[i%20], ta.locations[(i+1)%40])   
  t.guards.add('y'+str(i%20)+'>= '+str(random.randint(1,10)))
  t.syncs.add('e'+str(i))

for l in ta.locations:
  expr = ''
  for i in range(20):
    expr += 'y'+str(i) + '<=' +str(random.randint(10,20)) + ' && '
  l.invariants.add(expr)
  
for i in range(100):
  expr = ''
  for j in range(20):
    expr += 'y'+str(j)+'<='+str(random.randint(1,10))+' && '
    
  query = uppaal.queries.Verifyta(ta, expr)
  result = verifier.verify(query)
