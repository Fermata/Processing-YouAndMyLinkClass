class NNArray {
	private ArrayList dataList;

	public NNArray () {
		this.dataList = new ArrayList();
	}

	public void withRows (ArrayList rows) {
		for(int i = 0; i < rows.size(); i++){
			NNRow row = (NNRow)(rows.get(i));
			NNDictionary rowDictionary = new NNDictionary();
			rowDictionary.withRow(row);
			this.add().set(rowDictionary);
		}
	}

	public NNDynamicValue add () {
		NNDynamicValue value = new NNDynamicValue();
		this.dataList.add(value);
		return value;
	}

	public NNDynamicValue get (int index) {
		return (NNDynamicValue)(this.dataList.get(index));
	}

	public void remove (int index) {
		this.dataList.remove(index);
	}

	public String serialize () {
		int dataListSize = this.dataList.size();
		StringBuffer serialized = new StringBuffer();
		serialized.append("[");
		for(int i = 0; i < dataListSize; i++){
			NNDynamicValue value = (NNDynamicValue)(this.dataList.get(i));
			serialized.append(value.serialize());
			if(i + 1 != dataListSize){
				serialized.append(",");
			}
		}
		serialized.append("]");
		return serialized.toString();
	}

	public void each (NNArrayIterator iterator) {
		int dataListSize = this.dataList.size();
		for(int i = 0; i < dataListSize; i++){
			NNDynamicValue value = (NNDynamicValue)(this.dataList.get(i));
			iterator.iterate(i, value);
		}
	}
}

class NNDictionary {
	private ArrayList dataList;

	public NNDictionary () {
		this.dataList = new ArrayList();
	}

	public void withRow (NNRow row) {
		NNTableSchema schema = row.schema;
		for(int i = 0; i < schema.dataNames.length; i++){
			if(schema.dataTypes[i].equals("String")){
				this.key(schema.dataNames[i]).set(row.column(i).stringValue());
			}else if(schema.dataTypes[i].equals("int")){
				this.key(schema.dataNames[i]).set(row.column(i).integerValue());
			}
		}
	}

	private int position (String key) {
		int dataListSize = this.dataList.size();
		for(int i = 0; i < dataListSize; i++){
			NNKeyValue keyValue = (NNKeyValue)(this.dataList.get(i));
			if(keyValue.is(key)){
				return i;
			}
		}
		return -1;
	}

	public NNDynamicValue key (String key) {
		int keyPosition = this.position(key);
		if(keyPosition != -1){
			return ((NNKeyValue)(this.dataList.get(keyPosition))).value();
		}else{
			NNKeyValue keyValue = new NNKeyValue(key);
			this.dataList.add(keyValue);
			return keyValue.value();
		}
	}

	public NNDynamicValue get (String key) {
		return ((NNKeyValue)(this.dataList.get(this.position(key)))).value();
	}

	public void remove (String key) {
		this.dataList.remove(this.position(key));
	}

	public String serialize () {
		int dataListSize = this.dataList.size();
		StringBuffer serialized = new StringBuffer();
		serialized.append("{");
		for(int i = 0; i < dataListSize; i++){
			NNKeyValue keyValue = (NNKeyValue)(this.dataList.get(i));
			serialized.append("\"");
			serialized.append(keyValue.key());
			serialized.append("\":");
			serialized.append(keyValue.value().serialize());
			if(i + 1 != dataListSize){
				serialized.append(",");
			}
		}
		serialized.append("}");
		return serialized.toString();
	}

	public void each (NNDictionaryIterator iterator) {
		int dataListSize = this.dataList.size();
		for(int i = 0; i < dataListSize; i++){
			NNKeyValue keyValue = (NNKeyValue)(this.dataList.get(i));
			iterator.iterate(keyValue.key(), keyValue.value());
		}
	}
}

class NNKeyValue {
	private String keyString;
	private NNDynamicValue value;

	public NNKeyValue (String keyString) {
		this.keyString = keyString;
		this.value = new NNDynamicValue();
	}

	public NNKeyValue (String keyString, NNDynamicValue value) {
		this.keyString = keyString;
		this.value = value;
	}

	public NNKeyValue (String keyString, int value) {
		this.keyString = keyString;
		this.setValue(value);
	}

	public NNKeyValue (String keyString, String value) {
		this.keyString = keyString;
		this.setValue(value);
	}

	public NNKeyValue (String keyString, float value) {
		this.keyString = keyString;
		this.setValue(value);
	}

	public NNKeyValue (String keyString, boolean value) {
		this.keyString = keyString;
		this.setValue(value);
	}

	public NNKeyValue (String keyString, NNDictionary value) {
		this.keyString = keyString;
		this.setValue(value);
	}

	public NNKeyValue (String keyString, NNArray value) {
		this.keyString = keyString;
		this.setValue(value);
	}

	public void setValue (int value) {
		this.value = new NNDynamicValue(value);
	}

	public void setValue (String value) {
		this.value = new NNDynamicValue(value);
	}

	public void setValue (boolean value) {
		this.value = new NNDynamicValue(value);
	}

	public void setValue (float value) {
		this.value = new NNDynamicValue(value);
	}

	public void setValue (NNDictionary value) {
		this.value = new NNDynamicValue(value);
	}

	public void setValue (NNArray value) {
		this.value = new NNDynamicValue(value);
	}

	public boolean is (String keyString) {
		return this.keyString.equals(keyString);
	}

	public String key () {
		return this.keyString;
	}

	public NNDynamicValue value () {
		return this.value;
	}
}

class NNDynamicValue {
	private int type;
	private Object value;

	public NNDynamicValue () {
		this.type = 1;
		this.value = "";
	}
	
	public NNDynamicValue (String stringValue) {
		this.set(stringValue);
	}

	public NNDynamicValue (int integerValue) {
		this.set(integerValue);
	}

	public NNDynamicValue (float floatValue) {
		this.set(floatValue);
	}

	public NNDynamicValue (boolean booleanValue) {
		this.set(booleanValue);
	}

	public NNDynamicValue (NNDictionary dictionaryValue) {
		this.set(dictionaryValue);
	}

	public NNDynamicValue (NNArray arrayValue) {
		this.set(arrayValue);
	}

	public void set (String stringValue) {
		this.type = 1;
		this.value = stringValue;
	}

	public void set (int integerValue) {
		this.type = 2;
		this.value = (Integer)integerValue;
	}

	public void set (float floatValue) {
		this.type = 3;
		this.value = (Float)floatValue;
	}

	public void set (boolean booleanValue) {
		this.type = 4;
		this.value = (Boolean)booleanValue;
	}

	public void set (NNDictionary dictionaryValue) {
		this.type = 5;
		this.value = dictionaryValue;
	}

	public void set (NNArray arrayValue) {
		this.type = 6;
		this.value = arrayValue;
	}

	public Object value () {
		return this.value;
	}

	public String stringValue () {
		return (String)(this.value);
	}

	public int integerValue () {
		return (Integer)(this.value);
	}

	public float floatValue () {
		return (Float)(this.value);
	}

	public boolean booleanValue () {
		return (Boolean)(this.value);
	}

	public NNDictionary dictionaryValue () {
		return (NNDictionary)(this.value);
	}

	public NNArray arrayValue () {
		return (NNArray)(this.value);
	}

	public String serialize () {
		switch(this.type){
			case 1: return "\"" + ((String)(this.value)).replaceAll("\"", "\\\"") + "\"";
			case 2:	return ((Integer)(this.value)).toString();
			case 3: return ((Float)(this.value)).toString();
			case 4: return ((Boolean)(this.value)).toString();
			case 5: return ((NNDictionary)(this.value)).serialize();
			case 6: return ((NNArray)(this.value)).serialize();
		}
		return "";
	}
}

interface NNDictionaryIterator {
	public void iterate (String key, NNDynamicValue value);
}

interface NNArrayIterator {
	public void iterate (int index, NNDynamicValue value);
}