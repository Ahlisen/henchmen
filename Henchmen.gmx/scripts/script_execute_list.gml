///script_execute_list(script_index, ds_list<arguments>): result
//Executes script with arguments stored in ds_list

var arguments = argument1;
switch ds_list_size(arguments)
{
    case 0: return script_execute(argument0); break;
    case 1: return script_execute(argument0, arguments[| 0]); break;
    case 2: return script_execute(argument0, arguments[| 0], arguments[| 1]); break;
    case 3: return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2]); break;
    case 4: return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3]); break;
    case 5: return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3], arguments[| 4]); break;
    case 6: return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3], arguments[| 4], arguments[| 5]); break;
    case 7: return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3], arguments[| 4], arguments[| 5], arguments[| 6]); break;
    case 8: return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3], arguments[| 4], arguments[| 5], arguments[| 6], arguments[| 7]); break;
    case 9: return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3], arguments[| 4], arguments[| 5], arguments[| 6], arguments[| 7], arguments[| 8]); break;
    case 10:return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3], arguments[| 4], arguments[| 5], arguments[| 6], arguments[| 7], arguments[| 8], arguments[| 9]); break;
    case 11:return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3], arguments[| 4], arguments[| 5], arguments[| 6], arguments[| 7], arguments[| 8], arguments[| 9], arguments[| 10]); break;
    case 12:return script_execute(argument0, arguments[| 0], arguments[| 1], arguments[| 2], arguments[| 3], arguments[| 4], arguments[| 5], arguments[| 6], arguments[| 7], arguments[| 8], arguments[| 9], arguments[| 10], arguments[| 11]); break
    default:
        show_message('Too many arguments'); break;
}
