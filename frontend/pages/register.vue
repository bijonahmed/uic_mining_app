<template>
  <div>
    <title>Signup</title>

    <div class="wrapper">
      <div class="nav-menu">
        <nav class="menu">
          <!-- Menu navigation start -->
          <Sidebar />
          <!-- Menu navigation end -->
        </nav>
      </div>
      <div class="wrapper-inline">
        <!-- Header area start -->
        <!-- <Header/> -->
        <!-- Footer menu -->
        <Footer />
        <!-- Page content start -->
        <main class="margin mt-0">
          <div class="dash-balance">
            <div class="dash-content relative">
              <h3 class="w-text">Signup</h3>
              <div class="notification">

              </div>
            </div>
          </div>

          <section class="bal-section container">
            <div class="container">
              <div class="form-divider"></div>


              <form class="mt-12" @submit.prevent="register()">

                <div class="alert alert-success" v-if="showmessages" style="text-align: center; font-size: 12px;">{{
                  showmessages }}</div>

                <div class="form-row-group with-icons">

                  <div class="form-row no-padding">
                    <i class="fa fa-user"></i>
                    <input type="text" name="name" class="form-element" placeholder="User name" v-model="name">
                    <span class="text-danger" v-if="errors.name">{{ errors.name[0] }}</span>
                  </div>

                  <div class="form-row no-padding">
                    <i class="fa-brands fa-whatsapp"></i>
                    <div class="whatsapp-input w-100">
                      <div class="d-flex justify-content-center align-items-center w-100">

                        <select v-model="selectedCountryCode" @change="whatsAppCode()" class="country-code-dropdown">
                          <option v-for="(country, index) in countryCodes" :key="index.code" :value="country.code"> {{
                            country.name }} ({{ country.code }})</option>
                        </select>




                        <input type="text" name="phone" class="form-element" placeholder="Whatsapp Number"
                          v-model="phone_number" @input="filterNumericInput">

                      </div>
                    </div>
                    <span class="text-danger" v-if="errors.phone_number">{{ errors.phone_number[0] }}</span>
                  </div>

                  <div class="form-row no-padding">
                    <i class="fa fa-envelope"></i>
                    <input type="email" name="Email" class="form-element" placeholder="Email" v-model="email">
                    <span class="text-danger" v-if="errors.email">{{ errors.email[0] }}</span>
                  </div>
                  <div class="form-row no-padding">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="Password" class="form-element" placeholder="Password"
                      v-model="password">
                    <span class="text-danger" v-if="errors.password">{{ errors.password[0] }}</span>
                  </div>
                  <div class="form-row no-padding">
                    <i class="fa fa-lock"></i>
                    <input type="password" name="rePassword" class="form-element" placeholder="Confirm Password"
                      v-model="confirmPassword">

                    <span class="text-danger" v-if="errors.confirmPassword">{{ errors.confirmPassword[0]
                      }}</span>
                  </div>
                  <div class="form-row no-padding">
                    <i class="fa fa-link"></i>
                    <input type="text" name="Invite-Code" class="form-element" placeholder="Invitation Code"
                      v-model="inviteCode">
                    <!-- <span class="text-danger" v-if="errors.inviteCode">{{ errors.inviteCode[0] }}</span> -->
                  </div>
                </div>

                <div class="form-divider"></div>

                <div class="form-row">
                  <!-- <a href="#" class="button circle block orange">Sign Up</a> :disabled="loading"-->
                  <button class="button circle block orange" type="submit">Sign up
                    <span v-if="loading">Loading...</span>
                  </button>
                </div>

                <div class="form-row txt-center mt-15">
                  Already have an account? <nuxt-link to="/login" data-loader='show'>Login</nuxt-link>
                </div>
              </form>

            </div>

          </section>


        </main>
        <!-- Page content end -->
      </div>
    </div>
  </div>
</template>


<script setup>
import Sidebar from "~/layouts/Sidebar.vue";
import Header from "~/layouts/Header.vue";

import { ref, watch, onMounted } from "vue";
import { useUserStore } from '~~/stores/user';
import axios from "axios";

const router = useRouter();
const userStore = useUserStore()
const errors = ref({});

const selectedCountryCode = ref('+92');
const countryCodes = ref([
  { name: 'Afghanistan', code: '+93', dialCode: '93' },
  { name: 'Albania', code: '+355', dialCode: '355' },
  { name: 'Algeria', code: '+213', dialCode: '213' },
  { name: 'Andorra', code: '+376', dialCode: '376' },
  { name: 'Angola', code: '+244', dialCode: '244' },
  { name: 'Antigua and Barbuda', code: '+1-268', dialCode: '268' },
  { name: 'Argentina', code: '+54', dialCode: '54' },
  { name: 'Armenia', code: '+374', dialCode: '374' },
  { name: 'Australia', code: '+61', dialCode: '61' },
  { name: 'Austria', code: '+43', dialCode: '43' },
  { name: 'Azerbaijan', code: '+994', dialCode: '994' },
  { name: 'Bahamas', code: '+1-242', dialCode: '242' },
  { name: 'Bahrain', code: '+973', dialCode: '973' },
  { name: 'Bangladesh', code: '+880', dialCode: '880' },
  { name: 'Barbados', code: '+1-246', dialCode: '246' },
  { name: 'Belarus', code: '+375', dialCode: '375' },
  { name: 'Belgium', code: '+32', dialCode: '32' },
  { name: 'Belize', code: '+501', dialCode: '501' },
  { name: 'Benin', code: '+229', dialCode: '229' },
  { name: 'Bhutan', code: '+975', dialCode: '975' },
  { name: 'Bolivia', code: '+591', dialCode: '591' },
  { name: 'Bosnia and Herzegovina', code: '+387', dialCode: '387' },
  { name: 'Botswana', code: '+267', dialCode: '267' },
  { name: 'Brazil', code: '+55', dialCode: '55' },
  { name: 'Brunei', code: '+673', dialCode: '673' },
  { name: 'Bulgaria', code: '+359', dialCode: '359' },
  { name: 'Burkina Faso', code: '+226', dialCode: '226' },
  { name: 'Burundi', code: '+257', dialCode: '257' },
  { name: 'Cabo Verde', code: '+238', dialCode: '238' },
  { name: 'Cambodia', code: '+855', dialCode: '855' },
  { name: 'Cameroon', code: '+237', dialCode: '237' },
  { name: 'Canada', code: '+1', dialCode: '1' },
  { name: 'Central African Republic', code: '+236', dialCode: '236' },
  { name: 'Chad', code: '+235', dialCode: '235' },
  { name: 'Chile', code: '+56', dialCode: '56' },
  { name: 'China', code: '+86', dialCode: '86' },
  { name: 'Colombia', code: '+57', dialCode: '57' },
  { name: 'Comoros', code: '+269', dialCode: '269' },
  { name: 'Congo (Congo-Brazzaville)', code: '+242', dialCode: '242' },
  { name: 'Congo (Democratic Republic)', code: '+243', dialCode: '243' },
  { name: 'Costa Rica', code: '+506', dialCode: '506' },
  { name: 'Croatia', code: '+385', dialCode: '385' },
  { name: 'Cuba', code: '+53', dialCode: '53' },
  { name: 'Cyprus', code: '+357', dialCode: '357' },
  { name: 'Czech Republic', code: '+420', dialCode: '420' },
  { name: 'Denmark', code: '+45', dialCode: '45' },
  { name: 'Djibouti', code: '+253', dialCode: '253' },
  { name: 'Dominica', code: '+1-767', dialCode: '767' },
  { name: 'Dominican Republic', code: '+1-809', dialCode: '809' },
  { name: 'Ecuador', code: '+593', dialCode: '593' },
  { name: 'Egypt', code: '+20', dialCode: '20' },
  { name: 'El Salvador', code: '+503', dialCode: '503' },
  { name: 'Equatorial Guinea', code: '+240', dialCode: '240' },
  { name: 'Eritrea', code: '+291', dialCode: '291' },
  { name: 'Estonia', code: '+372', dialCode: '372' },
  { name: 'Eswatini', code: '+268', dialCode: '268' },
  { name: 'Ethiopia', code: '+251', dialCode: '251' },
  { name: 'Fiji', code: '+679', dialCode: '679' },
  { name: 'Finland', code: '+358', dialCode: '358' },
  { name: 'France', code: '+33', dialCode: '33' },
  { name: 'Gabon', code: '+241', dialCode: '241' },
  { name: 'Gambia', code: '+220', dialCode: '220' },
  { name: 'Georgia', code: '+995', dialCode: '995' },
  { name: 'Germany', code: '+49', dialCode: '49' },
  { name: 'Ghana', code: '+233', dialCode: '233' },
  { name: 'Greece', code: '+30', dialCode: '30' },
  { name: 'Grenada', code: '+1-473', dialCode: '473' },
  { name: 'Guatemala', code: '+502', dialCode: '502' },
  { name: 'Guinea', code: '+224', dialCode: '224' },
  { name: 'Guinea-Bissau', code: '+245', dialCode: '245' },
  { name: 'Guyana', code: '+592', dialCode: '592' },
  { name: 'Haiti', code: '+509', dialCode: '509' },
  { name: 'Honduras', code: '+504', dialCode: '504' },
  { name: 'Hungary', code: '+36', dialCode: '36' },
  { name: 'Iceland', code: '+354', dialCode: '354' },
  { name: 'India', code: '+91', dialCode: '91' },
  { name: 'Indonesia', code: '+62', dialCode: '62' },
  { name: 'Iran', code: '+98', dialCode: '98' },
  { name: 'Iraq', code: '+964', dialCode: '964' },
  { name: 'Ireland', code: '+353', dialCode: '353' },
  { name: 'Israel', code: '+972', dialCode: '972' },
  { name: 'Italy', code: '+39', dialCode: '39' },
  { name: 'Jamaica', code: '+1-876', dialCode: '876' },
  { name: 'Japan', code: '+81', dialCode: '81' },
  { name: 'Jordan', code: '+962', dialCode: '962' },
  { name: 'Kazakhstan', code: '+7', dialCode: '7' },
  { name: 'Kenya', code: '+254', dialCode: '254' },
  { name: 'Kiribati', code: '+686', dialCode: '686' },
  { name: 'Korea (North)', code: '+850', dialCode: '850' },
  { name: 'Korea (South)', code: '+82', dialCode: '82' },
  { name: 'Kuwait', code: '+965', dialCode: '965' },
  { name: 'Kyrgyzstan', code: '+996', dialCode: '996' },
  { name: 'Laos', code: '+856', dialCode: '856' },
  { name: 'Latvia', code: '+371', dialCode: '371' },
  { name: 'Lebanon', code: '+961', dialCode: '961' },
  { name: 'Lesotho', code: '+266', dialCode: '266' },
  { name: 'Liberia', code: '+231', dialCode: '231' },
  { name: 'Libya', code: '+218', dialCode: '218' },
  { name: 'Liechtenstein', code: '+423', dialCode: '423' },
  { name: 'Lithuania', code: '+370', dialCode: '370' },
  { name: 'Luxembourg', code: '+352', dialCode: '352' },
  { name: 'Madagascar', code: '+261', dialCode: '261' },
  { name: 'Malawi', code: '+265', dialCode: '265' },
  { name: 'Malaysia', code: '+60', dialCode: '60' },
  { name: 'Maldives', code: '+960', dialCode: '960' },
  { name: 'Mali', code: '+223', dialCode: '223' },
  { name: 'Malta', code: '+356', dialCode: '356' },
  { name: 'Marshall Islands', code: '+692', dialCode: '692' },
  { name: 'Mauritania', code: '+222', dialCode: '222' },
  { name: 'Mauritius', code: '+230', dialCode: '230' },
  { name: 'Mexico', code: '+52', dialCode: '52' },
  { name: 'Micronesia', code: '+691', dialCode: '691' },
  { name: 'Moldova', code: '+373', dialCode: '373' },
  { name: 'Monaco', code: '+377', dialCode: '377' },
  { name: 'Mongolia', code: '+976', dialCode: '976' },
  { name: 'Montenegro', code: '+382', dialCode: '382' },
  { name: 'Morocco', code: '+212', dialCode: '212' },
  { name: 'Mozambique', code: '+258', dialCode: '258' },
  { name: 'Myanmar', code: '+95', dialCode: '95' },
  { name: 'Namibia', code: '+264', dialCode: '264' },
  { name: 'Nauru', code: '+674', dialCode: '674' },
  { name: 'Nepal', code: '+977', dialCode: '977' },
  { name: 'Netherlands', code: '+31', dialCode: '31' },
  { name: 'New Zealand', code: '+64', dialCode: '64' },
  { name: 'Nicaragua', code: '+505', dialCode: '505' },
  { name: 'Niger', code: '+227', dialCode: '227' },
  { name: 'Nigeria', code: '+234', dialCode: '234' },
  { name: 'North Macedonia', code: '+389', dialCode: '389' },
  { name: 'Norway', code: '+47', dialCode: '47' },
  { name: 'Oman', code: '+968', dialCode: '968' },
  { name: 'Pakistan', code: '+92', dialCode: '92' },
  { name: 'Palau', code: '+680', dialCode: '680' },
  { name: 'Panama', code: '+507', dialCode: '507' },
  { name: 'Papua New Guinea', code: '+675', dialCode: '675' },
  { name: 'Paraguay', code: '+595', dialCode: '595' },
  { name: 'Peru', code: '+51', dialCode: '51' },
  { name: 'Philippines', code: '+63', dialCode: '63' },
  { name: 'Poland', code: '+48', dialCode: '48' },
  { name: 'Portugal', code: '+351', dialCode: '351' },
  { name: 'Qatar', code: '+974', dialCode: '974' },
  { name: 'Romania', code: '+40', dialCode: '40' },
  { name: 'Russia', code: '+7', dialCode: '7' },
  { name: 'Rwanda', code: '+250', dialCode: '250' },
  { name: 'Saint Kitts and Nevis', code: '+1-869', dialCode: '869' },
  { name: 'Saint Lucia', code: '+1-758', dialCode: '758' },
  { name: 'Saint Vincent and the Grenadines', code: '+1-784', dialCode: '784' },
  { name: 'Samoa', code: '+685', dialCode: '685' },
  { name: 'San Marino', code: '+378', dialCode: '378' },
  { name: 'Sao Tome and Principe', code: '+239', dialCode: '239' },
  { name: 'Saudi Arabia', code: '+966', dialCode: '966' },
  { name: 'Senegal', code: '+221', dialCode: '221' },
  { name: 'Serbia', code: '+381', dialCode: '381' },
  { name: 'Seychelles', code: '+248', dialCode: '248' },
  { name: 'Sierra Leone', code: '+232', dialCode: '232' },
  { name: 'Singapore', code: '+65', dialCode: '65' },
  { name: 'Slovakia', code: '+421', dialCode: '421' },
  { name: 'Slovenia', code: '+386', dialCode: '386' },
  { name: 'Solomon Islands', code: '+677', dialCode: '677' },
  { name: 'Somalia', code: '+252', dialCode: '252' },
  { name: 'South Africa', code: '+27', dialCode: '27' },
  { name: 'South Sudan', code: '+211', dialCode: '211' },
  { name: 'Spain', code: '+34', dialCode: '34' },
  { name: 'Sri Lanka', code: '+94', dialCode: '94' },
  { name: 'Sudan', code: '+249', dialCode: '249' },
  { name: 'Suriname', code: '+597', dialCode: '597' },
  { name: 'Sweden', code: '+46', dialCode: '46' },
  { name: 'Switzerland', code: '+41', dialCode: '41' },
  { name: 'Syria', code: '+963', dialCode: '963' },
  { name: 'Taiwan', code: '+886', dialCode: '886' },
  { name: 'Tajikistan', code: '+992', dialCode: '992' },
  { name: 'Tanzania', code: '+255', dialCode: '255' },
  { name: 'Thailand', code: '+66', dialCode: '66' },
  { name: 'Timor-Leste', code: '+670', dialCode: '670' },
  { name: 'Togo', code: '+228', dialCode: '228' },
  { name: 'Tonga', code: '+676', dialCode: '676' },
  { name: 'Trinidad and Tobago', code: '+1-868', dialCode: '868' },
  { name: 'Tunisia', code: '+216', dialCode: '216' },
  { name: 'Turkey', code: '+90', dialCode: '90' },
  { name: 'Turkmenistan', code: '+993', dialCode: '993' },
  { name: 'Tuvalu', code: '+688', dialCode: '688' },
  { name: 'Uganda', code: '+256', dialCode: '256' },
  { name: 'Ukraine', code: '+380', dialCode: '380' },
  { name: 'United Arab Emirates', code: '+971', dialCode: '971' },
  { name: 'United Kingdom', code: '+44', dialCode: '44' },
  { name: 'United States', code: '+1', dialCode: '1' },
  { name: 'Uruguay', code: '+598', dialCode: '598' },
  { name: 'Uzbekistan', code: '+998', dialCode: '998' },
  { name: 'Vanuatu', code: '+678', dialCode: '678' },
  { name: 'Vatican City', code: '+379', dialCode: '379' },
  { name: 'Venezuela', code: '+58', dialCode: '58' },
  { name: 'Vietnam', code: '+84', dialCode: '84' },
  { name: 'Yemen', code: '+967', dialCode: '967' },
  { name: 'Zambia', code: '+260', dialCode: '260' },
  { name: 'Zimbabwe', code: '+263', dialCode: '263' }
]);

const whatsAppCode = () => {
  if (!phone_number.value) {
    phone_number.value = selectedCountryCode.value;
  } else {
    phone_number.value = selectedCountryCode.value;

  }
}

const loading = ref(false)
let email = ref('');
let name = ref('');
let phone_number = ref('+92');
let password = ref(null);
let inviteCode = ref(null);
let confirmPassword = ref(null);
let otp = ref(null)
let messages = ref('');


const passwordFieldType = ref('password');
const confirmPasswordFieldType = ref('password');

const filterNumericInput = (event) => {
  const value = event.target.value;
  phone_number.value = value.replace(/\D/g, '');
}

const togglePassword = (id) => {
  const inputField = document.querySelector(id);
  if (inputField.type === 'password') {
    inputField.type = 'text';
  } else {
    inputField.type = 'password';
  }
};

const checkEmail = async () => {
  try {
    loading.value = true;
    const response = await axios.post('/unauthenticate/checkEmail', {
      email: email.value // Send the email value in the request body
    });
    console.log("Send Code: " + response.data);
    //productdata.value = response.data.data;

  } catch (error) {
    if (error.response && error.response.status === 422) {
      errors.value = error.response.data.errors;
    } else {
      // Handle other types of errors here
      console.error('An error occurred:', error);
    }
  }
};

const buttonDisabled = ref(false); // Initially, button is enabled

async function sendCode() {
  if (!buttonDisabled.value) { // Check if button is not disabled
    try {
      loading.value = true; // Show loader
      buttonDisabled.value = true; // Disable the button to prevent double-clicking
      // Your asynchronous operation (e.g., axios request)
      await checkEmail(); // Assuming checkEmail is an asynchronous function
    } finally {
      loading.value = false; // Hide loader
      buttonDisabled.value = false; // Re-enable the button after operation completes or fails
    }
  }
}
let showmessages = ref('');
const register = async () => {
  loading.value = true;
  try {
    await userStore.register(
      name.value,
      phone_number.value,
      email.value,
      otp.value,
      inviteCode.value,
      password.value,
      confirmPassword.value
    )
    // Access the response data
    const messages = "Registration successful!.";
    console.log("messages:" + messages); // You can handle the messages here
    showmessages.value = messages;

    router.push('/login')


  } catch (error) {
    //console.log(error)
    errors.value = error.response.data.errors
  } finally {
    loading.value = false; // Hide loader

  }

}

</script>

<style>
.country-code-dropdown {
  border: none;
  padding-left: 20px;
  width: auto;
  border-bottom: solid 1px #EEE;
  height: 40px;
  outline: 0 !important;
  max-width: 100px;
  background: #fff;
}
</style>
