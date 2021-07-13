import java.util.Scanner;
import java.util.Random;

public class VMM {
    static int numOfMemAccesses;
    static int numOfTriples;
    static int pgsMalloced;

    static int[] physicalPg1 = new int[8];
    static int[] physicalPg2 = new int[8];
    static int[] physicalPg3 = new int[8];
    static PD pgDirectory;

    public static void main(String[] args) {
        pgDirectory = new PD();
        System.out.println("P : " + physicalPg1.length);
        userInput();
    }
    
    public static String binaryConvert(int x) {
        String binary = Integer.toBinaryString(x);
        int size = binary.length();
        if (size < 32) {
            while (binary.length() < 32) {
                binary += 0;
            }
        }
        return binary;
    }

    public static void wReq(int x, int y) {
        String a = binaryConvert(x);
        String b = binaryConvert(y);
        String PD_index = a.substring(0, 9);
        String PT_index = a.substring(10, 19);
        String offset = a.substring(20, 31);
        pgDirectory.Edit(b, PD_index, PT_index, offset);
    }

    public static void rReq(int x) {
        String a = binaryConvert(x);
        String PD_index = a.substring(0, 9);
        String PT_index = a.substring(10, 19);
        String offset = a.substring(20, 31);
        String data = pgDirectory.Access(PD_index, PT_index, offset);
        System.out.println(data);    
    }

    public static void userInput() {           
        while(true) { 
            Scanner input = new Scanner(System.in);
            System.out.println("\nInput: ");
			String data = input.nextLine();
            if (data.charAt(0) == 'w') {
                String[] sep = data.split(" ");
                int address = Integer.parseInt(sep[1]);
                int value = Integer.parseInt(sep[2]);
                malloc(address, value);
            }
            if (data.charAt(0) == 'r') {
                String[] sep = data.split(" ");
                int address = Integer.parseInt(sep[1]);
                rReq(address);
            }
            if (data.charAt(0) == 'q') { break; }
        }
    }

    public static void malloc(int x, int y){
        Random randPhyiscal = new Random();
        Random randVirtual = new Random();
        int randP = randPhyiscal.nextInt(8);
        int randV = randVirtual.nextInt(1024);
        boolean full = true;
        for(int i = 0; i < 8; i++) {
            if(physicalPg3[i] == 0) {
                System.out.println("Storing in Physical Page " + (i + 1));
                physicalPg1[i] = x;
                physicalPg2[i] = y;
                physicalPg3[i] = 1;
                full = false;
                break;
            }
        }
        if(full) {
            System.out.println("Dumping Physical Page " + randP);
            int tmpAddy = physicalPg1[randP];
            int tmpVal = physicalPg2[randP];
            System.out.print("Address: " + tmpAddy);
            System.out.println("Value: " + tmpVal);
            System.out.println("Allocating....\n");
            physicalPg3[randP] = 0;
            wReq(tmpAddy, tmpVal);
            System.out.println("\n *  *  *  Done mallocing a new page Malloc Real Page  *  *  *");
            malloc(x, y);
        }
    }
}