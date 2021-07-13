public class PT {
    String[] Arr;
    public PT() { this.Arr = new String[1023]; }

    public void setData (int index, int offset, String value) {
        if (Arr[index] != null) {
           String tmp1 = Arr[index].substring(0, offset);
           String tmp2 = Arr[index].substring(offset, offset + 7);
           String tmp3 = Arr[index].substring(offset + 7, Arr[index].length() - 1);
           Arr[index] = tmp1 + value + tmp3;
        } else {
            Arr[index] = "00000000000000000000000000000000";
            String tmp1 = Arr[index].substring(0, offset);
            String tmp2 = Arr[index].substring(offset, offset + 7);
            String tmp3 = Arr[index].substring(offset + 7, Arr[index].length() - 1);
            Arr[index] = tmp1 + value + tmp3;
        }
    }

    public String getData(int index, int offset) {
        if (Arr[index] != null) {
            return Arr[index].substring(offset, offset + 7);
        } else {
            return "00000000000000000000000000000000";
        }
    }
}
