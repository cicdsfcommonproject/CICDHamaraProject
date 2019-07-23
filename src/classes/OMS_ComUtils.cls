public class OMS_ComUtils{
        public static boolean ProfilePrimaryChangePermission(String ProfileName){
        List<String> listProfiles = System.Label.OMS_PrimaryChangePermission.Split(',');
        Set<String> setProfiles = new Set<String> (listProfiles);
        return setProfiles.contains(ProfileName) ? true : false;
    }
}