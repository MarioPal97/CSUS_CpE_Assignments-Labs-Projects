public class PD {
    PT[] Arr;
    public PD() { this.Arr = new PT[1023]; }

    public String Access(String PD_index, String PT_index, String Offset) {
        int PD = Integer.parseInt(PD_index, 2);
        int PT = Integer.parseInt(PT_index, 2);
        int offset = Integer.parseInt(Offset, 2);
        if (Arr[PD] == null) {
            return "00000000000000000000000000000000";
        } else {
            return Arr[PD].getData(PT, offset);
        }
    }

    public void Edit(String Value, String PD_index, String PT_index, String Offset) {
        int PD = Integer.parseInt(PD_index, 2);
        int PT = Integer.parseInt(PT_index, 2);
        int offset = Integer.parseInt(Offset, 2);
        System.out.println("Page Directory: 0x" + binToHex(PD_index)); 
        System.out.println("Page Table: 0x" + binToHex(PT_index));
        System.out.println("Offset: 0x" + binToHex(Offset));
        Arr[PD] = new PT();
        Arr[PD].setData(PT, offset, Value);
    }

    public String binToHex(String x){
        int tmp = Integer.parseInt(x, 2);
        String hex = Integer.toHexString(tmp);
        return hex;
    }
}