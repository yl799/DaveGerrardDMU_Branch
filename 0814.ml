import uppaal.core 
import uppaal.automata
import uppaal.verifier

class ECLTranslator:
  def __init__(self, ecl_spec):
    self.ecl_spec = ecl_spec
  
  def translate(self):
    ta = uppaal.automata.TimedAutomaton()
    
    # Add clocks
    ta.clocks.add('x')  
    ta.clocks.add('y')   
    
    # Add locations 
    l0 = ta.locations.add('l0')
    l1 = ta.locations.add('l1')
    
    # Add initial location
    ta.init = l0 
    
    # Add transitions
    t0 = ta.transitions.add(l0, l1)
    t0.guards.add('x <= 5')
    t0.syncs.add('a!')
    
    t1 = ta.transitions.add(l1, l0) 
    t1.guards.add('y >= 10')
    t1.syncs.add('b?')
    
    # Add invariants
    l0.invariants.add('x <= 10')
    l1.invariants.add('y <= 20')
    
    return ta

translator = ECLTranslator('some ECL spec')
ta = translator.translate()

verifier = uppaal.verifier.Verifier()
result = verifier.verifyta(ta)

if result.satisfied():
  print('ECL spec is valid')
else:
  print('ECL spec is invalid')
