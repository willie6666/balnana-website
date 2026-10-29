"""Check website locale coverage against the inspected App inventory."""
import json
import re
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
files=list((ROOT/'lib/l10n').glob('*.arb'))
base=json.loads((ROOT/'lib/l10n/site_en.arb').read_text())
keys={key for key in base if not key.startswith('@')}
expected={entry['app_locale'] for entry in json.loads((ROOT/'docs/locale-inventory.json').read_text())['locales']}
actual=set()
for file in files:
    data=json.loads(file.read_text())
    actual.add(data['@@locale'])
    assert {key for key in data if not key.startswith('@')}==keys,f'{file}: mismatched message keys'
    assert all(isinstance(data[key],str) and data[key].strip() for key in keys),f'{file}: empty message'
    for key in keys:
        assert set(re.findall(r'\{(\w+)',data[key]))==set(re.findall(r'\{(\w+)',base[key])),f'{file}: {key} placeholders differ'
assert actual==expected,f'Locale mismatch: {actual ^ expected}'
print(f'{len(files)} locales, {len(keys)} messages each; inventory and placeholders match.')
