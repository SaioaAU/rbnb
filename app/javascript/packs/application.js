require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import { myCalendar } from "../components/calendar.js"
myCalendar();

